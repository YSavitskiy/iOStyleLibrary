//
//  ThemeLabel.swift
//  ExampleStyle
//
//  Created by Yuriy Savitskiy on 11/18/20.
//  Copyright © 2020 Yuriy Savitskiy. All rights reserved.
//

import UIKit
import iOStyleLibrary

extension Theme
{
    static let boldLabelStyle =  ThemeStyle<UILabel> { label in
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 23)
        label.sizeToFit()
    }
            
    static let normalLabelStyle = ThemeStyle<UILabel> { label in
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .orange
        label.font =  .systemFont(ofSize: 18)
        label.sizeToFit()
    }
    
    static let purpleLabelStyle =  ThemeStyle<UILabel> { label in
        label.textColor = .purple
    }
    
    static let italicLabelStyle =  ThemeStyle<UILabel> { label in
        if let descriptor = label.font.fontDescriptor.withSymbolicTraits(.traitItalic) {
           label.font = UIFont(descriptor: descriptor, size: label.font.pointSize)
        }
    }
    
}


