//
//  String+Extensions.swift
//  Weather
//
//  Created by Haiyan Ma on 07/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.height
    }
    
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.width
    }
    
    class func setupWithText(_ text: String, description: String, textFont: UIFont, descriptionFont: UIFont, textColor: UIColor, descriptionColor: UIColor) -> NSMutableAttributedString?{
        
        let textAttribute = [NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor] as [String : Any]
        let descriptionAttribute = [NSFontAttributeName: descriptionFont, NSForegroundColorAttributeName: descriptionColor]
        
        let attributedText = NSMutableAttributedString(string: text,
                                                       attributes: textAttribute)
        let descriptionAttributedString = NSMutableAttributedString(string: description,
                                                                attributes:  descriptionAttribute)
        attributedText.append(descriptionAttributedString)
        return attributedText
    }
}
