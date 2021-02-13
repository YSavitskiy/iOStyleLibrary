//
//  ThemeStyle.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

/*public class ThemeSourceStyle<T>: ThemeStyle<T> {
    var source: T
    
    public init(source: T) {
        self.source = source
        super.init(<#T##styling: ThemeStyleAction<T>##ThemeStyleAction<T>##(T) -> ()#>)
    }
}*/



public struct ThemeStyle<T> {
                            
    public var styling: ThemeStyleAction<T>
    
    public init(_ styling: @escaping ThemeStyleAction<T>) {
        self.styling = styling
    }
        
    @discardableResult
    public func apply(to source: T) -> Stylist<T> {
        self.styling(source)
        return Stylist<T>(source: source)
    }
                
    static public func +(lhs: ThemeStyle<T>, rhs: ThemeStyle<T>) -> ThemeStyle<T> {
        ThemeStyle (
        { (source: T) -> () in
            lhs.apply(to: source)
            rhs.apply(to: source)
        })
    }
}
