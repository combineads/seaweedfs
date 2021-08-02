package command

import (
	"fmt"
	flag "github.com/chrislusf/seaweedfs/weed/util/fla9"
	"github.com/posener/complete"
	completeinstall "github.com/posener/complete/cmd/install"
)

func AutocompleteMain(commands []*Command) bool {
	subCommands := make(map[string]complete.Command)
	helpSubCommands := make(map[string]complete.Command)
	for _, cmd := range commands {
		flags := make(map[string]complete.Predictor)
		cmd.Flag.VisitAll(func(flag *flag.Flag) {
			flags["-"+flag.Name] = complete.PredictAnything
		})
		flags["-h"] = complete.PredictNothing

		subCommands[cmd.Name()] = complete.Command{
			Flags: flags,
		}
		helpSubCommands[cmd.Name()] = complete.Command{}
	}
	subCommands["help"] = complete.Command{Sub: helpSubCommands}

	globalFlags := make(map[string]complete.Predictor)
	flag.VisitAll(func(flag *flag.Flag) {
		globalFlags["-"+flag.Name] = complete.PredictAnything
	})
	globalFlags["-h"] = complete.PredictNothing

	weedCmd := complete.Command{
		Sub:   subCommands,
		Flags: globalFlags,
	}
	cmp := complete.New("weed", weedCmd)

	return cmp.Complete()
}

func installAutoCompletion() bool {
	err := completeinstall.Install("weed")
	if err != nil {
		fmt.Printf("install failed! %s\n", err)
		return false
	}
	fmt.Printf("autocompletion is enabled. Please restart your shell.\n")
	return true
}

func uninstallAutoCompletion() bool {
	err := completeinstall.Uninstall("weed")
	if err != nil {
		fmt.Printf("uninstall failed! %s\n", err)
		return false
	}
	fmt.Printf("autocompletion is disable. Please restart your shell.\n")
	return true
}

var cmdAutocomplete = &Command{
	Run:       runAutocomplete,
	UsageLine: "autocomplete",
	Short:     "install autocomplete",
	Long:      `An Autocomplete script is installed in the shell. Supported shells are bash, zsh, and fish.`,
}

func runAutocomplete(cmd *Command, args []string) bool {
	if len(args) != 0 {
		cmd.Usage()
	}

	return installAutoCompletion()
}

var cmdUnautocomplete = &Command{
	Run:       runUnautocomplete,
	UsageLine: "unautocomplete",
	Short:     "uninstall autocomplete",
	Long:      `An Autocomplete script is uninstalled in the shell.`,
}

func runUnautocomplete(cmd *Command, args []string) bool {
	if len(args) != 0 {
		cmd.Usage()
	}

	return uninstallAutoCompletion()
}
