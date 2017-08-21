//
//  MainGuideViewController.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 7. 2..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import Foundation
import UIKit

class MainGuideViewController: UIViewController {
    
    var titleNavigationBar: UINavigationBar!
    
    var mainPathCircleView: MainPathCircleView!
    var mainDigitalClockView: MainDigitalClockView!
    var mainCardView: MainCardView!
    
    
    var viewConstraintsContainer: [NSLayoutConstraint] = []
    
    let testJson: String! = "test"
    
    // view componenets pixel calculation
    var mainPathCircleViewWidth: CGFloat?
    var mainPathCircleViewHeight: CGFloat?
    
    var detailPathTableViewWidth: CGFloat?
    var detailPathTableViewHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calculate and set pixel with view size
        setViewComponenets()
        
        mainDigitalClockView.defaultSetup()
        mainCardView.defaultSetup()
        
        setupMainCardCollectionView()
        
    }
    
    override func viewDidLayoutSubviews() {
        mainPathCircleView.defaultSetting(withSuperViewFrame: self.view)
        
        
    }
    
}

extension MainGuideViewController {
    
    func setupMainCardCollectionView() {
        
        mainCardView.cardCollectionView?.delegate = self
        mainCardView.cardCollectionView?.dataSource = self
        
        mainCardView.cardCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cardCell")
        mainCardView.cardCollectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        mainCardView.cardCollectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
    }
    
}

extension MainGuideViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCardView.cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
    
}
