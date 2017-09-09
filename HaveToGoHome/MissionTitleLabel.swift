
//
//  MissionTitleLabel.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 9. 9..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

class MissionTitleLabel: UILabel {
    
    private var prefix: String!
    private var message: String!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(prefix: String, message: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        
        self.prefix = prefix
        self.message = message
        
        //TODO : 메세지 부분 강조 표시 가능하게 변경
        self.text = "  " + prefix + " : " + message + "   "
        
        setMissionTitleElement()
    }
    
    private func setMissionTitleElement() {
        
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        
        self.textColor = UIColor.black
        self.textAlignment = .center
        self.font = UIFont(name: "Apple SD 산돌고딕 Neo", size: 13)
    }

}
