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
        clockLabel.font = UIFont(name: "Montserrat-Regular", size: 60)
        clockLabel.adjustsFontSizeToFitWidth = true
        clockLabel.minimumScaleFactor = 0.5
        clockLabel.textColor = UIColor.white
        clockLabel.backgroundColor = UIColor.clear
        clockLabel.textAlignment = .center
        
        return clockLabel
    }()
    
    let timeDescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "00시간 00분 남았어요"
        descriptionLabel.font = UIFont(name: "Apple SD 산돌고딕 Neo", size: 20)
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = 0.5
        descriptionLabel.textColor = UIColor.white
        descriptionLabel.backgroundColor = UIColor.clear
        descriptionLabel.textAlignment = .center
        
        return descriptionLabel
    }()
    
    let missionDescriptionBubbleLabel: UILabel = {
        let bubblelabel = UILabel()
        bubblelabel.text = "출발시간"
        bubblelabel.font = UIFont(name: "Apple SD 산돌고딕 Neo", size: 17)
        bubblelabel.adjustsFontSizeToFitWidth = true
        bubblelabel.minimumScaleFactor = 0.5
        bubblelabel.textColor = UIColor.white
        bubblelabel.backgroundColor = UIColor.clear
        bubblelabel.textAlignment = .center
        
        bubblelabel.layer.borderWidth = 2.0
        bubblelabel.layer.borderColor = UIColor(white: 0.75, alpha: 0.9).cgColor
        bubblelabel.layer.cornerRadius = 15
        bubblelabel.layer.masksToBounds = true
        
        return bubblelabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func defaultSetup() {
        
        mainInfoClockLabel.translatesAutoresizingMaskIntoConstraints = false
        timeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        missionDescriptionBubbleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(mainInfoClockLabel)
        self.addSubview(timeDescriptionLabel)
        self.addSubview(missionDescriptionBubbleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let viewsDict : [String:Any] = [
            "mainInfoClockLabel" : mainInfoClockLabel,
            "timeDescriptionLabel" : timeDescriptionLabel,
            "missionDescriptionBubbleLabel" : missionDescriptionBubbleLabel
        ]
        
        let metricsDict : [String:Any?] = [
            "empty" : nil
        ]
    
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[mainInfoClockLabel]-10-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[mainInfoClockLabel]-50-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[timeDescriptionLabel]-10-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:[mainInfoClockLabel][timeDescriptionLabel(20)]", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[missionDescriptionBubbleLabel]-20-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:[missionDescriptionBubbleLabel(30)][mainInfoClockLabel]", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
        
    }

}
