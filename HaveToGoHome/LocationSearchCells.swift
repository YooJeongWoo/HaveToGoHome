//
//  LocationSearchCell.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 24..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

struct LocationSearch {
    var label: String?
    var discription: String?
    var x: CGFloat?
    var y: CGFloat?
}

struct SearchInformation {
    var image: UIImage?
    var label: String?
    var discription: String?
}

class LocationSearchCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    }
}

