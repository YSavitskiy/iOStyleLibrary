//
//  Stylist.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public struct Stylist<T> : IStylist {
    public let source: T
}




/*
public struct Stylist<T> : IStylist {
    public let source: T
    
    @discardableResult
    public func apply(_ styles: ThemeStyle<SourceType>...) -> Self {
        styles.forEach {
            $0(self.source)
        }
        return self
    }
}
*/






