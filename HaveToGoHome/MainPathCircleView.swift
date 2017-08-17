//
//  MainPathCircleView.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 8. 9..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

class MainPathCircleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var backGuidePath: CAShapeLayer?
    
    var guidePathRadius: CGFloat?
    var backGuidePathStroke:CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        backGuidePath = CAShapeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.backgroundColor = UIColor.clear
        backGuidePath = CAShapeLayer()
    }
    
    //default setting of MainPathCircleView
    func defaultSetting(withSuperViewFrame mainPathCircleView: UIView) {
        self.backgroundColor = UIColor.clear
        
        guidePathRadius = self.frame.width / 2.4
        backGuidePathStroke = guidePathRadius! / 35
        drawBackGuidePath(superViewFrame: mainPathCircleView)
    }
    
    // draw the back guide path
    private func drawBackGuidePath(superViewFrame: UIView) {
        
        //center point of mainPathCircle
        let center: CGPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        //test
        
        // get radius
        let (startAngle, endAngle) = self.getGraphStartAndEndPointsInRadians(startPointPercent: 0, endPointPercent: 100)
        
        let guidPath = UIBezierPath(arcCenter: center, radius: guidePathRadius!, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        backGuidePath?.path = guidPath.cgPath
        backGuidePath?.fillColor = UIColor.clear.cgColor
        backGuidePath?.strokeColor = UIColor(red: 62/255, green: 163/255, blue: 253/255, alpha: 1.0).cgColor
        backGuidePath?.lineWidth = backGuidePathStroke!
        backGuidePath?.lineCap = kCALineCapRound
        backGuidePath?.strokeEnd = 1.0
        backGuidePath?.lineDashPattern = [NSNumber(value: Float(backGuidePathStroke! * 1)), NSNumber(value: Float(backGuidePathStroke! * 2))]
        
        self.layer.addSublayer(backGuidePath!)
    }
    
    // erase the back guide path
    private func eraseBackGuidePath() {
        
    }
    
    // calculate the percentage path to radian values
    private func getGraphStartAndEndPointsInRadians(startPointPercent: CGFloat, endPointPercent: CGFloat) -> (graphStartingPoint: CGFloat, graphEndingPoint: CGFloat) {
        
        var adjStartPoint: CGFloat = startPointPercent
        var adjEndPoint: CGFloat = endPointPercent
        
        if ( 0 > startPointPercent ) {
            adjStartPoint = 0
        } else if ( 100 < startPointPercent ) {
            adjStartPoint = 100
        }
        
        
        if ( 0 > endPointPercent ) {
            adjEndPoint = 0
        } else if ( 100 < endPointPercent ) {
            adjEndPoint = 100
        }
        
        adjStartPoint -= 25
        adjEndPoint += adjStartPoint
        
        let π: CGFloat = CGFloat(M_PI)
        
        // now we can calculate our start and end points in radians
        let startPoint: CGFloat = ((2 * π) / 100) * (CGFloat(adjStartPoint))
        let endPoint: CGFloat = ((2 * π) / 100) * (CGFloat(adjEndPoint))
        
        return(startPoint, endPoint)
        
    } // func

}
