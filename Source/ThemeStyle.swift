//
//  ThemeStyle.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public struct ThemeStyle<T> {
    public let styling: (T) -> ()
    
    public func apply(to source: T) {
        styling(source)
    }
    
    public init(_ styling: @escaping (T) -> ()) {
        self.styling = styling
    }
}
