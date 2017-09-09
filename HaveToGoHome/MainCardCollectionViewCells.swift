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
        cardInnerCollectionView?.register(CardInnerMissionCell.self, forCellWithReuseIdentifier: "mission")
    }
    
}

extension MainCardCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        
        if indexPath == IndexPath(row: 0, section: 0) {
            cell =  cardInnerCollectionView?.dequeueReusableCell(withReuseIdentifier: "bottomButton", for: indexPath) as! CardInnerBottomButtonCell
        } else if indexPath == IndexPath(row: 1, section: 0) {
            cell = cardInnerCollectionView?.dequeueReusableCell(withReuseIdentifier: "mission", for: indexPath) as! CardInnerMissionCell
        } else {
            cell = cardInnerCollectionView?.dequeueReusableCell(withReuseIdentifier: "bottomButton", for: indexPath) as! CardInnerBottomButtonCell
        }
        
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize(width: (cardInnerCollectionView?.frame.width)!, height: 50)
        
        if indexPath == IndexPath(row: 0, section: 0) {
            size.height = 25
        } else if indexPath == IndexPath(row: 1, section: 0) {
            size.height = (cardInnerCollectionView?.frame.height)! - 85
        } else {
            size.height = 60
        }
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath == IndexPath(row: 0, section: 0) {
            cell.backgroundColor = UIColor.white
            addTopStretchButton(cell: cell)
        } else if indexPath == IndexPath(row: 1, section: 0) {
            cell.backgroundColor = UIColor.white
            setMissionCell(cell: cell)
        } else {
            cell.backgroundColor = UIColor.white
            addBottomButton(cell: cell)
        }

    }
    
}

class CardInnerBottomButtonCell: UICollectionViewCell {
    
}

class CardInnerMissionCell: UICollectionViewCell {
    private var missionTitleLabel: MissionTitleLabel!
    
    
}
