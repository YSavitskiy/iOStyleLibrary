

import UIKit
import iOStyleLibrary

struct Theme
{
    static let borderViewStyle = UIViewStyle<UIView> { view in
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
    }
    
    static let justViewStyle = UIViewStyle<UIView> { view in
        view.layer.cornerRadius = 0
        view.layer.borderWidth = 0
    }
}
