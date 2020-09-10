## Installation

### Using [SwiftLint](https://github.com/realm/SwiftLint):

Add these custom SwiftLint rules that will recommend using Blackboard when possible:

```
custom_rules:
  blackboard_color_name:
    name: "Blackboard Color Name"
    regex: "Color\\s*\\(\\s*\\\""
    message: "Prefer using Blackboard generated Color(asset:) over named strings."
    severity: warning
  blackboard_image_decorative:
    name: "Blackboard Image Decorative"
    regex: "Image\\s*\\(\\s*decorative\\s*\\:\\s*\\\""
    message: "Prefer using Blackboard generated Image(decorativeAsset:) over named strings."
    severity: warning
  blackboard_image_name:
    name: "Blackboard Image Name"
    regex: "Image\\s*\\(\\s*\\\""
    message: "Prefer using Blackboard generated Image(asset:) over named strings."
    severity: warning
  blackboard_uicolor_named:
    name: "Blackboard UIColor Named"
    regex: "UIColor\\s*\\(\\s*named\\s*\\:\\s*\\\""
    message: "Prefer using Blackboard generated UIColor static variables over named strings."
    severity: warning
  blackboard_uiimage_named:
    name: "Blackboard UIImage Named"
    regex: "UIImage\\s*\\(\\s*named\\s*\\:\\s*\\\""
    message: "Prefer using Blackboard generated UIImage static variables over named strings."
    severity: warning
```
