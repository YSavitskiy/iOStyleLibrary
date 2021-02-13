//
//  ThemeStyleAction.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/13/21.
//

import Foundation

public typealias ThemeStyleAction<T> = (T) -> ()

public func +<T:ITheme>(lhs: @escaping ThemeStyleAction<T>, rhs: @escaping ThemeStyleAction<T>) -> ThemeStyleAction<T> {
    { (source: T) -> () in
        lhs(source)
        rhs(source)
    }
}

