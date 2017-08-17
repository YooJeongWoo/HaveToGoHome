//
//  MainDigitalClockView.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 8. 17..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

class MainDigitalClockView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var viewConstraintsContainer: [NSLayoutConstraint] = []
    
    let mainInfoClockLabel: UILabel = {
        let clockLabel = UILabel()
        clockLabel.text = "00:00"
        clockLabel.textColor = UIColor.black
        clockLabel.backgroundColor = UIColor.clear
        clockLabel.textAlignment = .center
        return clockLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func defaultSetup() {
        
        mainInfoClockLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(mainInfoClockLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let viewDict : [String:Any] = [
            "mainInfoClockLabel" : mainInfoClockLabel
        ]
        
        let metricsDict : [String:Any?] = [
            "empty" : nil
        ]
    
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[mainInfoClockLabel]-10-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[mainInfoClockLabel]-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
        
    }

}
