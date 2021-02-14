//
//  ThemeStyle.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public struct ThemeStyle<SourceType> {
    public var styling: ThemeStyleAction<SourceType>
    
    public init(_ styling: @escaping ThemeStyleAction<SourceType>) {
        self.styling = styling
    }
        
    @discardableResult
    public func apply(to source: SourceType) -> Stylist<SourceType> {
        self.styling(source)
        return Stylist<SourceType>(source: source)
    }
                
    static public func +(lhs: ThemeStyle<SourceType>, rhs: ThemeStyle<SourceType>) -> ThemeStyle<SourceType> {
        ThemeStyle (
        { (source: SourceType) -> () in
            lhs.apply(to: source)
            rhs.apply(to: source)
        })
    }
    
    public static func += (lhs: inout ThemeStyle<SourceType> , rhs: ThemeStyle<SourceType>) {
        lhs = lhs + rhs
    }
}
