//
//  ThemeStates.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/14/21.
//

import Foundation

final class ThemeStates<T:ITheme> {
    var state = Optional<AnyHashable>.none
    var states = [AnyHashable: ThemeStyle<T>]()
}

private struct AssociatedKeys {
    static var statesDbKey = "statesDbKey"
    static var queueKey = "queueKey"
}

extension ITheme {
    var queue: DispatchQueue {
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
