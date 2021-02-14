//
//  Label+IStylist.swift
//  ExampleStyle
//
//  Created by Yuriy Savitskiy on 2/13/21.
//  Copyright © 2021 Yuriy Savitskiy. All rights reserved.
//

import iOStyleLibrary

public extension Stylist where SourceType: UILabel {
    @discardableResult
    func fontSize(_ size: CGFloat) -> Stylist<SourceType> {
        source.font = source.font.withSize(size)
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Stylist<SourceType> {
        source.textColor = color
        return self
    }
    
    @discardableResult
    func text(_ text: String?) -> Stylist<SourceType> {
        source.text = text
        return self
    }
    
    @discardableResult
    func boldLabelStyle() -> Stylist<UILabel> {
        return Style.boldLabel.apply(to: self.source)
    }
        
    @discardableResult
    func normalLabelStyle() -> Stylist<UILabel> {
        return Style.normalLabel.apply(to: self.source)
    }
    
    @discardableResult
    func italicLabelStyle() -> Stylist<UILabel> {
        return Style.italicLabel.apply(to: self.source)
    }
    
}
