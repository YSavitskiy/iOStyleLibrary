//
//  Stylist.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public struct Stylist<SourceType> : IStylist {
    public let source: SourceType
       
    init(source: SourceType) {
        self.source = source
    }
    
    @discardableResult
    public func apply(_ styles: ThemeStyle<SourceType>...) -> Self {
        styles.forEach {
            $0.apply(to: self.source)
        }
        return self
    }
    
    @discardableResult
    public static func +(lhs: Stylist<SourceType>, rhs: Stylist<SourceType>) -> Stylist<SourceType> {
        return lhs //lhs and rhs are identical
    }
        
    public static func += (lhs: inout Stylist<SourceType>, rhs: Stylist<SourceType>) {
        lhs = rhs //lhs and rhs are identical
    }
}



