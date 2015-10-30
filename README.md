# SimpleAvatar
Simple iOS app showing how to build a customizable avatar view using auto layout and IB Designable views.

## Usage
During class, we will start at the [1-class-start](https://github.com/DevMountain/SimpleAvatar/releases/tag/1-class-start) tag. We will talk a little about `@IBDesignable`, `@IBInspectable`, and using `didSet` before proceeding.

The focus of class will be understanding how to add views programatically. The bulk of our time should be spent understanding auto layout.

## Auto Layout
Auto Layout is a powerful way to layout views for iOS development in a future-friendly, device-agnostic way. The best resources to get started learning about it are found here:

- [Apple's Adaptive User Interface page](https://developer.apple.com/design/adaptivity/)

There are four ways to implement auto layout constraints (of class `NSLayoutConstraint`), and should generally be done in the following order of preference:

1. Interface Builder
2. Anchor-based constraints
3. Visual Format Language
4. Base API

There are three problems that can occur with auto layout, and they are almost always related to contraints:

1. Unsatisfiable constraints (shows as errors in console)
2. Ambiguous layout (can be seen in console by pausing application and entering `po [[UIWindow keyWindow] _autolayoutTrace]`)
3. Undesirable layouts (everything works properly, but is not laid out as you want)
