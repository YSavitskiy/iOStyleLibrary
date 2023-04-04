//
//  Stylist+UIView.swift
//  ExampleStyle
//
//  Created by Yuriy Savitskiy on 2/13/21.
//  Copyright © 2021 Yuriy Savitskiy. All rights reserved.
//

import iOStyleLibrary

public extension Stylist where SourceType: UIView {
    @discardableResult
    
    func cornerRadius(_ size: CGFloat) -> Stylist<SourceType> {
        source.layer.cornerRadius = size
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor) -> Stylist<SourceType> {
        source.backgroundColor = color
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Stylist<SourceType> {
        source.alpha = alpha
        return self
    }
}
