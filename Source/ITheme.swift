//
//  ITheme.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public protocol ITheme: AnyObject {
    associatedtype SourceType
    var stylist: Stylist<SourceType> { get set }    
}

public extension ITheme {
    var stylist: Stylist<Self> {
        get {
            Stylist(source: self)
        }
        set {
        }
    }
}

