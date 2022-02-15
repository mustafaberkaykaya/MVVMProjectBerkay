//
//  UIFont+Extensions.swift
//  UIComponents
//
//
//  Created by Mustafa Berkay Kaya on 11.02.2022.
//

import UIKit

public extension UIFont {
    
    enum FontWeight {
        case josefinSansBold
        case josefinSansSemiBold
        case josefinSansRegular
    }
    
    static func font(_ weight: UIFont.FontWeight, size: CGFloat) -> UIFont {
        let font: UIFont
        switch weight {
        case .josefinSansBold:
            font = FontFamily.JosefinSans.bold.font(size: size)
        case .josefinSansRegular:
            font = FontFamily.JosefinSans.regular.font(size: size)
        case .josefinSansSemiBold:
            font = FontFamily.JosefinSans.semiBold.font(size: size)
        }
        return font
    }
    
}
