## Installation

### Manually

Download [blackboard](https://github.com/NathanE73/Blackboard/releases) from the latest release's `bin` folder.

Place it in the projects root `bin` folder.

### Xcode

Integrate Blackboard into an Xcode scheme to get warnings and errors displayed
in the IDE. Just add a new "Run Script Phase" with:

```bash
if which "bin/blackboard" >/dev/null; then
  "bin/blackboard" --input "DeclarativeApp/Resources/" --output "DeclarativeApp/Source/Generated/"
else
  echo "warning: blackboard not installed, download from https://github.com/NathanE73/Blackboard"
fi
```
