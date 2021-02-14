

import UIKit
import iOStyleLibrary

extension UIView: ITheme {
    /*
    It is extending the UIView class to support object styles
    
    If you want to apply for all objects of objective C, use
    extension NSObject: ITheme {
    }
    */
}

struct Style
{
    static let borderView = ThemeStyle<UIView> { view in
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.backgroundColor = .orange
    }
    
    static let justView = ThemeStyle<UIView> { view in
        view.layer.cornerRadius = 0
        view.layer.borderWidth = 0
        view.backgroundColor = .systemGreen
    }
        
    static func alpha(_ alpha: CGFloat) -> ThemeStyle<UIView> {
        ThemeStyle<UIView> { view in
            view.alpha = alpha
        }
    }
}
