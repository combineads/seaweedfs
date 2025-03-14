package meta_cache

import (
	"context"
	"github.com/chrislusf/seaweedfs/weed/filer"
	"github.com/chrislusf/seaweedfs/weed/glog"
	"github.com/chrislusf/seaweedfs/weed/pb"
	"github.com/chrislusf/seaweedfs/weed/pb/filer_pb"
	"github.com/chrislusf/seaweedfs/weed/util"
)

func SubscribeMetaEvents(mc *MetaCache, selfSignature int32, client filer_pb.FilerClient, dir string, lastTsNs int64) error {

	processEventFn := func(resp *filer_pb.SubscribeMetadataResponse) error {
		message := resp.EventNotification

		for _, sig := range message.Signatures {
			if sig == selfSignature && selfSignature != 0 {
				return nil
			}
		}

		dir := resp.Directory
		var oldPath util.FullPath
		var newEntry *filer.Entry
		if message.OldEntry != nil {
			oldPath = util.NewFullPath(dir, message.OldEntry.Name)
			glog.V(4).Infof("deleting %v", oldPath)
		}

		if message.NewEntry != nil {
			if message.NewParentPath != "" {
				dir = message.NewParentPath
			}
			key := util.NewFullPath(dir, message.NewEntry.Name)
			glog.V(4).Infof("creating %v", key)
			newEntry = filer.FromPbEntry(dir, message.NewEntry)
		}
		err := mc.AtomicUpdateEntryFromFiler(context.Background(), oldPath, newEntry)
		if err == nil {
			if message.OldEntry != nil && message.NewEntry != nil {
				if message.OldEntry.Name == message.NewEntry.Name {
					// no need to invalidate
				} else {
					oldKey := util.NewFullPath(resp.Directory, message.OldEntry.Name)
					mc.invalidateFunc(oldKey)
					newKey := util.NewFullPath(dir, message.NewEntry.Name)
					mc.invalidateFunc(newKey)
				}
			} else if message.OldEntry == nil && message.NewEntry != nil {
				// no need to invaalidate
			} else if message.OldEntry != nil && message.NewEntry == nil {
				oldKey := util.NewFullPath(resp.Directory, message.OldEntry.Name)
				mc.invalidateFunc(oldKey)
			}
		}

		return err

	}

	return util.Retry("followMetaUpdates", func() error {
		return pb.WithFilerClientFollowMetadata(client, "mount", dir, lastTsNs, selfSignature, processEventFn, true)
	})

}
