//
//  ITheme.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public protocol ITheme: class {
    associatedtype ThemeType
    var theme: Stylist<ThemeType> { get }
}

public extension ITheme {
    var theme: Stylist<Self> {
        get {
            Stylist(source: self)
        }
    }
}

