

import UIKit
import iOStyleLibrary

extension NSObject: ITheme {
}

struct Theme
{
    static let borderViewStyle = ThemeStyle<UIView> { view in
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.backgroundColor = .orange
    }
    
    static let justViewStyle = ThemeStyle<UIView> { view in
        view.layer.cornerRadius = 0
        view.layer.borderWidth = 0
        view.backgroundColor = .systemGreen
    }            
}



