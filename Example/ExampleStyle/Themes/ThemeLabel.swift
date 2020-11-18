//
//  ThemeLabel.swift
//  ExampleStyle
//
//  Created by Yuriy Savitskiy on 11/18/20.
//  Copyright © 2020 Yuriy Savitskiy. All rights reserved.
//

import Foundation
import iOStyleLibrary

extension Theme
{
    static let infoStepLabelStyle = UIViewStyle<UILabel> { label in
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = Asset.Colors.titleTextColor.color
        label.font = FontFamily.SFUIText.bold.font(size: 15) ?? UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
    }
}
