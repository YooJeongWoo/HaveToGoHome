//
//  MainViewControllerViewComponents.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 7. 22..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit
import Foundation

extension MainGuideViewController {
    
    // initialize the pixcel with view size
    func calculatePixelWithRation() {
        
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        
        mainPathCircleViewWidth = viewWidth * 256 / 667
        mainPathCircleViewHeight = viewHeight * 256 / 667
        
        detailPathTableViewWidth = viewWidth
        detailPathTableViewHeight = viewHeight * 195 / 667
    }
    
    // Set the subviews for MainGuideViewController
    func setViewComponenets() {
        calculatePixelWithRation()
        
        mainPathCircleView.frame = CGRect(x: 0, y: 0, width: mainPathCircleViewWidth!, height: mainPathCircleViewHeight!)
    }
    
    func getMainPathCircleViewWidth() -> CGFloat? {

        return mainPathCircleViewWidth
    }
    
    func getMainPathCircleViewHeight() -> CGFloat? {
        
        return mainPathCircleViewHeight
    }
    
    func getDetailPathTableViewWidth() -> CGFloat? {
        return detailPathTableViewWidth
    }
    
    func getDetailPathTableViewHeight() -> CGFloat? {
        return detailPathTableViewHeight
    }
    
}
