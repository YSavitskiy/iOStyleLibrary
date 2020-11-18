

import UIKit
import iOStyleLibrary

struct Theme
{
    static let borderViewStyle = UIViewStyle<UIView> { view in
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.backgroundColor = .red
    }
    
    static let justViewStyle = UIViewStyle<UIView> { view in
        view.layer.cornerRadius = 0
        view.layer.borderWidth = 0
        view.backgroundColor = .green
    }
}
