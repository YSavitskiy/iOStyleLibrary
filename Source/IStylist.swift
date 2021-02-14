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

