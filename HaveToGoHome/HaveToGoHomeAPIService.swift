//
//  HaveToGoHomeAPIService.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 7. 5..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import Foundation

class HaveToGoHomeService: NSObject {
    
    let client:HaveToGoHomeClient = HaveToGoHomeClient()
    
    override init() {
        super.init()
    }
    
    func test () {
        print("test")
        
        let method = ""
        let parameter:[String:AnyObject] = [HaveToGoHomeClient.ParameterKey.LimitTime:"23:07" as AnyObject, HaveToGoHomeClient.ParameterKey.UserLocation:"37.523657,126.925234" as AnyObject, HaveToGoHomeClient.ParameterKey.HomeLocation:"37.301684,126.856570" as AnyObject]
        
        let _ = client.taskFotGetMethod(method, parameter: parameter) { (results, error) in
            if error != nil {
                print ("error")
            } else {
                if results?[HaveToGoHomeClient.JsonResponseKeys.PathResults] as? [[String:AnyObject]] != nil {
                    print("success")
                } else {
                    print("result is nil")
                }
            }
            
        }
    }
    
}
