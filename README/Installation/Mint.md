## Installation

### Using [Mint](https://github.com/yonaskolb/Mint):

This will use the latest release of Blackboard.
The first time it runs, it will take around 20 seconds to download and build.

### Xcode

Integrate Blackboard into an Xcode scheme to get warnings and errors displayed
in the IDE. Just add a new "Run Script Phase" with:

```bash
if which mint >/dev/null; then
  mint run NathanE73/Blackboard --input "DeclarativeApp/Resources/" --output "DeclarativeApp/Source/Generated/"
else
  echo "warning: mint not installed, download from https://github.com/yonaskolb/Mint"
fi
```
