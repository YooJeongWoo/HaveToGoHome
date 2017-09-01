//
//  StretchButton.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 9. 1..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

class StretchButton: UIView {
    
    var button: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButtonElement()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButtonElement() {
        button = UIButton(type: .custom)
        button.setImage(UIImage(named: "arrow-up"), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(button!)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }

}
