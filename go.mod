module github.com/chrislusf/seaweedfs

go 1.16

require (
	cloud.google.com/go/pubsub v1.3.1
	cloud.google.com/go/storage v1.9.0
	github.com/Azure/azure-storage-blob-go v0.9.0
	github.com/OneOfOne/xxhash v1.2.2
	github.com/Shopify/sarama v1.23.1
	github.com/aws/aws-sdk-go v1.34.30
	github.com/buraksezer/consistent v0.0.0-20191006190839-693edf70fd72
	github.com/bwmarrin/snowflake v0.3.0
	github.com/cespare/xxhash v1.1.0
	github.com/chrislusf/raft v1.0.7
	github.com/coreos/go-semver v0.3.0 // indirect
	github.com/disintegration/imaging v1.6.2
	github.com/dustin/go-humanize v1.0.0
	github.com/eapache/go-resiliency v1.2.0 // indirect
	github.com/facebookgo/clock v0.0.0-20150410010913-600d898af40a
	github.com/facebookgo/ensure v0.0.0-20200202191622-63f1cf65ac4c // indirect
	github.com/facebookgo/stack v0.0.0-20160209184415-751773369052 // indirect
	github.com/facebookgo/stats v0.0.0-20151006221625-1b76add642e4
	github.com/facebookgo/subset v0.0.0-20200203212716-c811ad88dec4 // indirect
	github.com/fclairamb/ftpserverlib v0.8.0
	github.com/frankban/quicktest v1.7.2 // indirect
	github.com/go-errors/errors v1.1.1 // indirect
	github.com/go-redis/redis/v8 v8.4.4
	github.com/go-sql-driver/mysql v1.5.0
	github.com/gocql/gocql v0.0.0-20190829130954-e163eff7a8c6
	github.com/gogo/protobuf v1.2.2-0.20190730201129-28a6bbf47e48 // indirect
	github.com/golang-jwt/jwt v3.2.1+incompatible
	github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e
	github.com/golang/protobuf v1.4.3
	github.com/google/btree v1.0.0
	github.com/google/uuid v1.1.1
	github.com/gorilla/mux v1.7.4
	github.com/gorilla/websocket v1.4.1 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.0.1-0.20190118093823-f849b5445de4
	github.com/grpc-ecosystem/grpc-gateway v1.11.0 // indirect
	github.com/jcmturner/gofork v1.0.0 // indirect
	github.com/jinzhu/copier v0.2.8
	github.com/json-iterator/go v1.1.11
	github.com/karlseguin/ccache/v2 v2.0.7
	github.com/klauspost/compress v1.10.9 // indirect
	github.com/klauspost/cpuid v1.2.1 // indirect
	github.com/klauspost/crc32 v1.2.0
	github.com/klauspost/reedsolomon v1.9.2
	github.com/kurin/blazer v0.5.3
	github.com/lib/pq v1.10.0
	github.com/magiconair/properties v1.8.1 // indirect
	github.com/mattn/go-runewidth v0.0.4 // indirect
	github.com/olivere/elastic/v7 v7.0.19
	github.com/peterh/liner v1.1.0
	github.com/pierrec/lz4 v2.2.7+incompatible // indirect
	github.com/pquerna/cachecontrol v0.1.0
	github.com/prometheus/client_golang v1.11.0
	github.com/rcrowley/go-metrics v0.0.0-20190826022208-cac0b30c2563 // indirect
	github.com/seaweedfs/fuse v1.1.8
	github.com/seaweedfs/goexif v1.0.2
	github.com/skip2/go-qrcode v0.0.0-20200617195104-da1b6568686e
	github.com/spaolacci/murmur3 v1.1.0 // indirect
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/viper v1.4.0
	github.com/streadway/amqp v0.0.0-20200108173154-1c71cc93ed71
	github.com/stretchr/testify v1.6.1
	github.com/syndtr/goleveldb v1.0.0
	github.com/tecbot/gorocksdb v0.0.0-20191217155057-f0fad39f321c
	github.com/tidwall/gjson v1.8.1
	github.com/tidwall/match v1.0.3
	github.com/tsuna/gohbase v0.0.0-20201125011725-348991136365
	github.com/valyala/bytebufferpool v1.0.0
	github.com/viant/assertly v0.5.4 // indirect
	github.com/viant/ptrie v0.3.0
	github.com/viant/toolbox v0.33.2 // indirect
	github.com/willf/bitset v1.1.10 // indirect
	github.com/willf/bloom v2.0.3+incompatible
	go.etcd.io/etcd v3.3.15+incompatible
	go.mongodb.org/mongo-driver v1.7.0
	gocloud.dev v0.20.0
	gocloud.dev/pubsub/natspubsub v0.20.0
	gocloud.dev/pubsub/rabbitpubsub v0.20.0
	golang.org/x/image v0.0.0-20200119044424-58c23975cae1 // indirect
	golang.org/x/net v0.0.0-20201202161906-c7110b5ffcbb
	golang.org/x/sys v0.0.0-20210603081109-ebe580a85c40
	golang.org/x/tools v0.0.0-20201124115921-2c860bdd6e78
	google.golang.org/api v0.26.0
	google.golang.org/grpc v1.29.1
	google.golang.org/protobuf v1.26.0-rc.1
	gopkg.in/jcmturner/goidentity.v3 v3.0.0 // indirect
	gopkg.in/jcmturner/gokrb5.v7 v7.3.0 // indirect
	modernc.org/sqlite v1.10.7
	github.com/posener/complete v1.2.3
)

// replace github.com/seaweedfs/fuse => /Users/chris/go/src/github.com/seaweedfs/fuse
// replace github.com/chrislusf/raft => /Users/chris/go/src/github.com/chrislusf/raft

replace go.etcd.io/etcd => go.etcd.io/etcd v0.5.0-alpha.5.0.20200425165423-262c93980547
