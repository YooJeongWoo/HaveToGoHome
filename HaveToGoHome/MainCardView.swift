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
        
        cardCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cardCollectionView.backgroundColor = UIColor.black
        
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
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[cardCollectionView]|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
    }

}
