//
//  ThemeStates.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/14/21.
//

import Foundation

final public class ThemeStates<SourceType> {
    public var state = Optional<AnyHashable>.none
    public var savedStates = [AnyHashable: ThemeStyle<SourceType>]()
    public var savedActions = [AnyHashable: ThemeStyleAction<SourceType>]()
    
    public func clear() {
        self.state = Optional<AnyHashable>.none
        self.savedStates = [AnyHashable: ThemeStyle<SourceType>]()
        self.savedActions = [AnyHashable: ThemeStyleAction<SourceType>]()
    }
}

private struct AssociatedKeys {
    static var statesDbKey = "statesDbKey"
    static var queueKey = "queueKey"
}

extension ITheme {
    var statesQueue: DispatchQueue {
        get {
            if let queue = objc_getAssociatedObject(self, &AssociatedKeys.queueKey) as? DispatchQueue {
                return queue
            } else {
                let queue = DispatchQueue(label: "ThreadSafeCollection.queue", attributes: .concurrent)
                objc_setAssociatedObject(self, &AssociatedKeys.queueKey, queue, .OBJC_ASSOCIATION_RETAIN)
                return queue
            }
        }
    }
    
    var statesDb: ThemeStates<Self> {
        get {
            if let statesDb = objc_getAssociatedObject(self, &AssociatedKeys.statesDbKey) as? ThemeStates<Self> {
                return statesDb
            } else {
                let statesDb = ThemeStates<Self>()
                objc_setAssociatedObject(self, &AssociatedKeys.statesDbKey, statesDb, .OBJC_ASSOCIATION_RETAIN)
                return statesDb
            }
        }
    }
}
