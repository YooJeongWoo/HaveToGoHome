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
        clockLabel.backgroundColor = UIColor.red
        clockLabel.textAlignment = .center
        
        return clockLabel
    }()
    
    let timeDescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "00분 남았어요."
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.backgroundColor = UIColor.blue
        descriptionLabel.textAlignment = .center
        
        return descriptionLabel
    }()
    
    let missionDescriptionBubbleLabel: UILabel = {
        let bubblelabel = UILabel()
        bubblelabel.text = "efef"
        bubblelabel.textColor = UIColor.black
        bubblelabel.backgroundColor = UIColor.cyan
        bubblelabel.textAlignment = .center
        
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
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[mainInfoClockLabel]-40-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[timeDescriptionLabel]-10-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:[mainInfoClockLabel][timeDescriptionLabel(30)]", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[missionDescriptionBubbleLabel]-10-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:[missionDescriptionBubbleLabel(30)][mainInfoClockLabel]", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
        
    }

}
