//
//  MainCardCollectionViewCell.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 8. 21..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

class MainCardCollectionViewCell: UICollectionViewCell {
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        setupCard()
//    }
    
    func setupCard() {
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        backgroundColor = UIColor.white
    }
    
}
