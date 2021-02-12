//
//  Stylist+UIView.swift
//  ExampleStyle
//
//  Created by Yuriy Savitskiy on 2/13/21.
//  Copyright © 2021 Yuriy Savitskiy. All rights reserved.
//

import iOStyleLibrary

public extension Stylist where T: UIView {
    @discardableResult
    
    func cornerRadius(_ size: CGFloat) -> Stylist<T> {
        source.layer.cornerRadius = size
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor) -> Stylist<T> {
        source.backgroundColor = color
        return self
    }
}
