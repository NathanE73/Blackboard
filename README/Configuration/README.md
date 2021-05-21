## Configuration

### Command Line

```
% blackboard --help
USAGE: blackboard <options>

OPTIONS:
  --config <config>       Configuration file
  --skip-colors           Skip generating color extensions (Color, CGColor, and UIColor)
  --skip-data-assets      Skip generating data asset extensions (NSDataAsset)
  --skip-images           Skip generating image extensions (Image, UIImage)
  --skip-localizable      Skip generating localizable string support (Localizable)
  --skip-nib-validation   Skip validation of nib resource references
  --skip-storyboards      Skip generating storyboard extensions (UIStoryboard)
  --skip-storyboard-validation
                          Skip validation of storyboard resource references
  --skip-swiftui          Skip generating SwiftUI extensions (Color, Image)
  --skip-symbols          Skip generating symbol extensions (Image, UIImage)
  --skip-uikit            Skip generating UIKit extensions (UIColor, UIImage)
  --skip-validation       Skip validation of storyboard and nib resource references
  --input <input>         Input directory or directories
  --output <output>       Output directory; where generated code will be stored
  --version               Show the version.
  -h, --help              Show help information.
```

### Configuration File

Configure Blackboard by adding a .blackboard.yml file from the directory you'll run Blackboard from. The following parameters can be configured:

* `ios`: iOS deployment target and SDK versions
* `input`: List of input directory
* `output`: Output directory; where generated code will be stored
* `symbols`: List of symbol names
* `skip`: Skip generating various source file

Here is a sample configuration:

```yaml
ios:
  target: 13.0
  sdk: 14.5

input:
- Shared/Resources
- ExampleApp/Resources

output: ExampleApp/Source/Generated

symbols:
- a.book.closed
- 14.square.fill
- case
- case.fill
- character.book.closed
- chevron.down
- chevron.up
- die.face.1
- die.face.4
- infinity.circle.fill
- minus.circle.fill
- person
- person.2
- plus.circle.fill
- return
- repeat
- repeat.circle
```

Command line arguments override matching configuration option.

Here is a list of all of the corresponding skip command line arguments:

```yaml
skip:
- colors
- data-assets
- images
- localizable
- nib-validation
- storyboards
- storyboard-validation
- swiftui
- symbols
- uikit
- validation
```
