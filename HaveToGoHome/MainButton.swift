//
//  MainButton.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 8. 28..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

class MainButton: UIView {

    private var buttonLabel: String?
    var button: UIButton!
    
    func setLabel (label: String) {
        buttonLabel = label
        
        if button != nil {
            button.setTitle(buttonLabel, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButtonElement()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButtonElement() {
        button = UIButton(type: .system)
        
        buttonLabel = "test"
        
        button.setBackgroundImage(UIImage(named: "button_main2"), for: .normal)
        
        button.setTitle(buttonLabel, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Apple SD 산돌고딕 Neo", size: 15)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(button!)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
    }

}
