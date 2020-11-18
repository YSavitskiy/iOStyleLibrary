import UIKit

struct UIViewStyle<T> {
    
    let styling: (T)-> Void
    
    static func compose(_ styles: UIViewStyle<T>...)-> UIViewStyle<T> {
        return UIViewStyle { view in
            for style in styles {
                style.styling(view)
            }
        }
    }
    
    func apply(to view: T) {
        styling(view)
    }
}


