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
                if let key = newKey {
                    if let style = statesDb.savedStates[key] {
                        DispatchQueue.main.async {
                            source.stylist.apply(style)
                        }
                    }
                    
                    if let action = statesDb.savedActions[key] {
                        DispatchQueue.main.async {
                            action(source)
                        }
                    }
                }
                statesDb.state = newKey
            }
        }
    }
    
    public func resetStates() {
        self.source.statesDb.clear()
    }
    
    @discardableResult
    public func prepareState(state: AnyHashable, style: ThemeStyle<SourceType>) -> Stylist<SourceType> {
        self.source.statesQueue.async(flags: .barrier) {[weak source] in
            source?.statesDb.savedStates[state] = style
            source?.statesDb.savedActions[state] = nil
        }
        
        DispatchQueue.main.async {  [weak source] in
            if state == source?.statesDb.state {
                source?.stylist.apply(style)
            }
        }
        return self
    }
    
    @discardableResult
    public func prepareState(state: AnyHashable,  action: @escaping ThemeStyleAction<SourceType>) -> Stylist<SourceType> {
        self.source.statesQueue.async(flags: .barrier) {[weak source] in
            source?.statesDb.savedActions[state] = action
            source?.statesDb.savedStates[state] = nil
        }
        
        DispatchQueue.main.async {  [weak source] in
            if state == source?.statesDb.state,
               let source = source {
                    action(source)
            }
        }
        return self
    }
    
    @discardableResult
    public func prepareState(states: AnyHashable..., style: ThemeStyle<SourceType>) -> Stylist<SourceType> {
        self.source.statesQueue.async(flags: .barrier) {[weak source] in
            for state in states {
                source?.statesDb.savedStates[state] = style
                source?.statesDb.savedActions[state] = nil
            }
        }
        
        DispatchQueue.main.async {  [weak source] in
            if let state = source?.statesDb.state,
               states.contains(state) {
                source?.stylist.apply(style)
            }
        }
        return self
    }
    
    @discardableResult
    public func prepareState(states: AnyHashable..., action: @escaping ThemeStyleAction<SourceType>) -> Stylist<SourceType> {
        self.source.statesQueue.async(flags: .barrier) {[weak source] in
            for state in states {
                source?.statesDb.savedActions[state] = action
                source?.statesDb.savedStates[state] = nil
            }
        }
        
        DispatchQueue.main.async {  [weak source] in
            if let source = source,
               let state = source.statesDb.state,
               states.contains(state) {
                    action(source)
            }
        }
        return self
    }
    
    
}
