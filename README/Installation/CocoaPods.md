## Installation

### Using [CocoaPods](https://cocoapods.org):

Simply add the following line to your Podfile:

```ruby
pod 'Blackboard'
```

This will download the Blackboard binaries and dependencies in `Pods/` during your next
`pod install` execution and will allow you to invoke it via `${PODS_ROOT}/Blackboard/blackboard`
in your Script Build Phases.

This is the recommended way to install a specific version of Blackboard since it supports
installing a pinned version rather than simply the latest.

Note that this will add the Blackboard binaries, its dependencies' binaries and the Swift binary
library distribution to the `Pods/` directory, so checking in this directory to SCM such as
git is discouraged.

### Xcode

Integrate Blackboard into an Xcode scheme to get warnings and errors displayed
in the IDE. Just add a new "Run Script Phase" with:

```bash
if which "${PODS_ROOT}/Blackboard/blackboard" >/dev/null; then
  "${PODS_ROOT}/Blackboard/blackboard" --input "ExampleApp/Resources/" --output "ExampleApp/Source/Generated/"
else
  echo "warning: blackboard not installed, download from https://github.com/NathanE73/Blackboard"
fi
```
