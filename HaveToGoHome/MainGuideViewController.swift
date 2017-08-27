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
        
        if let flowLayout = mainCardView.cardCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 40
        }
        
        mainCardView.cardCollectionView?.delegate = self
        mainCardView.cardCollectionView?.dataSource = self
        
        mainCardView.cardCollectionView?.register(MainCardCollectionViewCell.self, forCellWithReuseIdentifier: "cardCell")
        
        mainCardView.cardCollectionView.isPagingEnabled = true
        
    }
    
}

extension MainGuideViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCardView.cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! MainCardCollectionViewCell
        
        cell.setupCard()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mainCardView.cardCollectionView.frame.width - 40, height: mainCardView.cardCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
//        let totalCellWidth = 4 * mainCardView.cardCollectionView.frame.width
//        let totalSpacingWidth = CGFloat(3 * 20)
//        
//        let leftInset = (mainCardView.cardCollectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
//        let rightInset = leftInset
        
        return UIEdgeInsetsMake(0, 20, 0, 20)
    }
    
}
