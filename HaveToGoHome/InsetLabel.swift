//
//  InsetLabel.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 20..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

@IBDesignable class InsetLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 10.0
    @IBInspectable var bottomInset: CGFloat = 10.0
    @IBInspectable var leftInset: CGFloat = 15.0
    @IBInspectable var rightInset: CGFloat = 10.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        var intrinsicContentSize = super.intrinsicContentSize
        intrinsicContentSize.height += topInset + bottomInset
        intrinsicContentSize.width += leftInset + rightInset
        return intrinsicContentSize        
    }

}
