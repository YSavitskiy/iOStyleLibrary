# iOS Style Library 
Library for managing element styles

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements
iOS 11


## Installation

iOStyleLibrary is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'iOStyleLibrary'
```

#### Swift Package Manager

iOStyleLibrary is available through [Swift Package Manager](https://swift.org/package-manager).

Add it to an existing Xcode project as a package dependency:

1. From the **File** menu, select **Add Packages**
2. Enter "https://github.com/YSavitskiy/iOStyleLibrary" into the package repository URL text field
3. Press "Add Package"

### iOStyleLibrary versions.

Below is a table that shows which version of iOStyleLibrary you should use for
your project.

| iOStyleLibrary | Description                               |
| -------------- | ----------------------------------------- |
| 2.0            | ThemeStyle<SourceType>                    | 
|                |                                           | 
| 1.0            | UIViewStyle<T>                            |


## Usage

Add extension for the classes that you want to apply styles

For example:  

```
import iOStyleLibrary

extension UIView: ITheme {
    /*
    It is extending the UIView class to support object styles
    
    If you want to apply for all objects of objective C, use
    extension NSObject: ITheme {
    }
    */
}
```

## Styles

Add styles:
```
struct Style
{
    static let borderView = ThemeStyle<UIView> { view in
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.backgroundColor = .orange
    }
}
    
```

Or add actions to the Stylist struct
```
import iOStyleLibrary

public extension Stylist where SourceType: UIView {
    @discardableResult
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Stylist<SourceType> {
        source.alpha = alpha
        return self
    }
}
```

## Use it 

```
Style.borderView.apply(to: self.subrectView)

//OR 

self.rectView.stylist.apply(Style.borderView)

self.rectView.stylist.alpha(0.5)
```

Concatenation
```
self.label.stylist
            .fontSize(22)
            .text("newText")
            .textColor(.systemRed)

let newLabelStyle = Style.boldLabel + Style.purpleLabel + Style.italicLabel
self.label.stylist.apply(newLabelStyle)
```

States 
```
private enum AnyEnumStyleState {
	case exampleState1
        case exampleState2
}

private func prepareStyleStates() {
        
        self.rectView.stylist.prepareState(state: AnyEnumStyleState.exampleState1,
                                           style: Style.alpha(0.5) + Style.justView )
                        
        self.rectView.stylist.prepareState(state: AnyEnumStyleState.exampleState2,
                                           action: {  view in
                                                UIView.animate(withDuration: 1) {
                                                    view.alpha = 1
                                                    view.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                                                    view.backgroundColor = .systemYellow
                                                }
                                            })
        
        self.subrectView.stylist.prepareState(state: AnyEnumStyleState.exampleState1,
                                              style: Style.borderView)
        
        self.subrectView.stylist.prepareState(state: AnyEnumStyleState.exampleState2,
                                              style: Style.justView)
}

//and use it 
	//switch to state 
        self.rectView.stylist.state = AnyEnumStyleState.exampleState1        
	//switch to another state      
        self.rectView.stylist.state = AnyEnumStyleState.exampleState2

```

Source files for these are in the `Example` directory. Have fun!

## License
MIT License. See [License.md](https://github.com/YSavitskiy/iOStyleLibrary/blob/main/LICENSE.md) for more information.
Copyright (c) 2020 Yuriy Savitskiy.
