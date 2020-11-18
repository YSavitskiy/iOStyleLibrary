import UIKit

public struct UIViewStyle<T> {
    
    public let styling: (T)-> Void
    
    public static func compose(_ styles: UIViewStyle<T>...)-> UIViewStyle<T> {
        return UIViewStyle { view in
            for style in styles {
                style.styling(view)
            }
        }
    }
    
    public func apply(to view: T) {
        styling(view)
    }                
}
