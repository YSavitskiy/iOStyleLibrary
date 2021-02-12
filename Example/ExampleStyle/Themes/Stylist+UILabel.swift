//
//  Label+IStylist.swift
//  ExampleStyle
//
//  Created by Yuriy Savitskiy on 2/13/21.
//  Copyright © 2021 Yuriy Savitskiy. All rights reserved.
//

import iOStyleLibrary

public extension Stylist where T: UILabel {
    @discardableResult
    func fontSize(_ size: CGFloat) -> Stylist<T> {
        source.font = source.font.withSize(size)
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Stylist<T> {
        source.textColor = color
        return self
    }
    
    @discardableResult
    func text(_ text: String?) -> Stylist<T> {
        source.text = text
        return self
    }
}
