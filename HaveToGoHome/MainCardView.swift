//
//  MainCardView.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 8. 18..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

class MainCardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var cardCollectionView: UICollectionView!
    
    var viewConstraintsContainer: [NSLayoutConstraint] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func defaultSetup() {
        
        let layout = UICollectionViewFlowLayout()
        
        cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cardCollectionView.backgroundColor = UIColor.clear
        
        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cardCollectionView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        let viewsDict : [String:Any] = [
            "cardCollectionView" : cardCollectionView
        ]
        
        let metricsDict : [String:Any?] = [
            "empty" : nil
        ]
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|[cardCollectionView]|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|[cardCollectionView]-20-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
    }

}

extension MainCardCollectionViewCell {
    func setupInnerCollectionView () {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        cardInnerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cardInnerCollectionView?.backgroundColor = UIColor.white
        
        cardInnerCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cardInnerCollectionView!)
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        var viewConstraintsContainer: [NSLayoutConstraint] = []
        
        let viewsDict : [String:Any] = [
            "cardInnerCollectionView" : cardInnerCollectionView!
        ]
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|[cardInnerCollectionView]|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|[cardInnerCollectionView]|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
    }
    
    func addBottomButton(cell: UICollectionViewCell) {
        let buttonView: MainButton = MainButton()
        buttonView.setLabel(label: "도보 경로 보기")
        
        cell.addSubview(buttonView)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        var viewConstraintsContainer: [NSLayoutConstraint] = []
        
        let viewsDict : [String:Any] = [
            "buttonView" : buttonView
        ]
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|[buttonView]|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|[buttonView]|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
    }
    
    func addTopStretchButton(cell: UICollectionViewCell) {
        let buttonView: StretchButton = StretchButton()
        
        cell.addSubview(buttonView)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        var viewConstraintsContainer: [NSLayoutConstraint] = []
        
        let viewsDict : [String:Any] = [
            "buttonView" : buttonView
        ]
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|[buttonView]|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|[buttonView]|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
        
    }
    
    // set mission Section with labes and views
    func setMissionCell(cell: UICollectionViewCell) {
        var missionTitleLabel: MissionTitleLabel!
        missionTitleLabel = MissionTitleLabel(prefix: "미션", message: "버스 탑승")
        
        cell.addSubview(missionTitleLabel)
        
        missionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var viewConstraintsContainer: [NSLayoutConstraint] = []
        
        let viewsDict : [String:Any] = [
            "missionTitleLabel" : missionTitleLabel
        ]
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[missionTitleLabel]", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
        NSLayoutConstraint(item: missionTitleLabel, attribute: .centerX, relatedBy: .equal, toItem: cell, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: missionTitleLabel, attribute: .width, relatedBy: .equal, toItem: cell, attribute: .width, multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: missionTitleLabel, attribute: .height, relatedBy: .equal, toItem: cell, attribute: .height, multiplier: 0, constant: 20).isActive = true
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
    }
    
}

extension CardInnerBottomButtonCell {
    
}

