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
        
        mainPathCircleView = MainPathCircleView()
        mainDigitalClockView = MainDigitalClockView()
        mainCardView = MainCardView()
        titleNavigationBar = UINavigationBar()
        
        mainPathCircleView.translatesAutoresizingMaskIntoConstraints = false
        mainDigitalClockView.translatesAutoresizingMaskIntoConstraints = false
        mainCardView.translatesAutoresizingMaskIntoConstraints = false
        titleNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        titleNavigationBar.setBackgroundImage(UIImage(), for: .default)
        titleNavigationBar.shadowImage = UIImage()
        
        let titleItem = UINavigationItem(title: "집에는 가야지")
        titleNavigationBar.setItems([titleItem], animated: false)
        titleNavigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        mainDigitalClockView.backgroundColor = UIColor.clear
        
        mainCardView.backgroundColor = UIColor.white
        
        self.view.addSubview(mainPathCircleView)
        self.view.addSubview(mainDigitalClockView)
        self.view.addSubview(mainCardView)
        self.view.addSubview(titleNavigationBar)
        
        addConstraintsForViews()
    }
    
    private func addConstraintsForViews () {
        
        let viewsDict : [String:Any] = [
            "mainPathCircleView" : mainPathCircleView,
            "titleNavBar" : titleNavigationBar,
            "mainDigitalClockView" : mainDigitalClockView,
            "mainCardView" : mainCardView
        ]
        
        let metricsDict : [String:Any] = [
            "leftPadding" : NSNumber(integerLiteral: 10)
        ]
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[titleNavBar(20)]", options: .alignAllCenterY, metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|[titleNavBar]|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:[titleNavBar]-40-[mainPathCircleView]", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[mainPathCircleView]-25-|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        NSLayoutConstraint(item: mainPathCircleView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: mainPathCircleView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: mainDigitalClockView, attribute: .centerY, relatedBy: .equal, toItem: mainPathCircleView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mainDigitalClockView, attribute: .centerX, relatedBy: .equal, toItem: mainPathCircleView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mainDigitalClockView, attribute: .height, relatedBy: .equal, toItem: mainPathCircleView, attribute: .height, multiplier: 0.55, constant: 0).isActive = true
        NSLayoutConstraint(item: mainDigitalClockView, attribute: .width, relatedBy: .equal, toItem: mainDigitalClockView, attribute: .height, multiplier: 1.1, constant: 0).isActive = true
        
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:[mainPathCircleView]-5-[mainCardView]|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        viewConstraintsContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|[mainCardView]|", options: NSLayoutFormatOptions(), metrics: metricsDict, views: viewsDict)
        
        
        NSLayoutConstraint.activate(viewConstraintsContainer)
        
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
