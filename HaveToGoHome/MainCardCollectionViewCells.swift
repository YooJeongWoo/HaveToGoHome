//
//  MainCardCollectionViewCell.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 8. 21..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

enum CardMode {
    case mission
    case pathSelect
}

class MainCardCollectionViewCell: UICollectionViewCell {
    
    var cardInnerCollectionView: UICollectionView?
    var cardMode: CardMode?
    
    func setupCard() {
        
        cardMode = CardMode.mission
        
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        backgroundColor = UIColor.white
        
        setupInnerCollectionView()
        
        cardInnerCollectionView?.delegate = self
        cardInnerCollectionView?.dataSource = self
        cardInnerCollectionView?.register(CardInnerBottomButtonCell.self, forCellWithReuseIdentifier: "bottomButton")
    }
    
}

extension MainCardCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardInnerCollectionView?.dequeueReusableCell(withReuseIdentifier: "bottomButton", for: indexPath) as! CardInnerBottomButtonCell
        
        if indexPath == IndexPath(row: 0, section: 0) {
            cell.backgroundColor = UIColor.blue
        } else if indexPath == IndexPath(row: 1, section: 0) {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize(width: (cardInnerCollectionView?.frame.width)!, height: 50)
        
        if indexPath == IndexPath(row: 0, section: 0) {
            size.height = 30
        } else if indexPath == IndexPath(row: 1, section: 0) {
            size.height = (cardInnerCollectionView?.frame.height)! - 80
        } else {
            size.height = 50
        }
        
        return size
    }
    
}

class CardInnerBottomButtonCell: UICollectionViewCell {
    
}
