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
    
    @IBOutlet weak var mainPathCircleView: UIView!
    
    
    // view componenets pixel calculation
    var mainPathCircleViewWidth: CGFloat?
    var mainPathCircleViewHeight: CGFloat?
    
    var detailPathTableViewWidth: CGFloat?
    var detailPathTableViewHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calculate and set pixel with view size
        setViewComponenets()
    }
    
    
    
    
}
