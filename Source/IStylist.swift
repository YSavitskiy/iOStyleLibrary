//
//  IStylist.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public protocol IStylist {
    associatedtype SourceType
    var source: SourceType { get }     
}

public extension IStylist where SourceType: ITheme {
    @discardableResult
    func apply(_ styles: ThemeStyle<SourceType>...) -> Self {
        styles.forEach {
            $0.apply(to: self.source)
        }
        return self
    }
}

