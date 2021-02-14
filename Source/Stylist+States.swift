//
//  Stylist+States.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/14/21.
//

import Foundation

public protocol IThemeStates {
    var state: Optional<AnyHashable> {get set}
    func resetStates()
}

extension Stylist where SourceType: ITheme {
    public var state: Optional<AnyHashable> {
        get {
            self.source.statesDb.state
        }
        set(newKey) {
            self.source.statesQueue.sync {[weak source] in
                guard let source = source else {return}
                let statesDb = source.statesDb
                if let key = newKey,
                   let style = statesDb.savedStates[key] {
                   DispatchQueue.main.async {
                        source.stylist.apply(style)
                   }
                }
                statesDb.state = newKey
            }
        }
    }
    
    public func resetStates() {
        self.source.statesDb.clear()
    }
}
