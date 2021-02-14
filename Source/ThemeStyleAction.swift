//
//  ThemeStyleAction.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/13/21.
//

import Foundation

public typealias ThemeStyleAction<SourceType> = (SourceType) -> ()

public func +<SourceType:ITheme>(lhs: @escaping ThemeStyleAction<SourceType>,
                                 rhs: @escaping ThemeStyleAction<SourceType>) -> ThemeStyleAction<SourceType> {
    { (source: SourceType) -> () in
        lhs(source)
        rhs(source)
    }
}

