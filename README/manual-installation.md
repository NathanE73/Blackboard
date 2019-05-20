### Manual Installation

Download [portable-blackboard.zip](https://github.com/NathanE73/Blackboard/releases) from the latest release's assets.

Extract `blackboard` and place it in the projects root `bin` folder.

### Xcode

Integrate Blackboard into an Xcode scheme to get warnings and errors displayed
in the IDE. Just add a new "Run Script Phase" with:

```bash
if which "bin/blackboard" >/dev/null; then
  "bin/blackboard" "ExampleApp/Resources/" "ExampleApp/Source/Generated/"
else
  echo "warning: blackboard not installed, download from https://github.com/NathanE73/Blackboard"
fi
```
