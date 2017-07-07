//
//  HaveToGoHomeAPIConstant.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 7. 5..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

extension HaveToGoHomeClient {
    
    struct Constants {
        static let ApiScheme = "http"
        static let ApiHost = "app.havetogohome.ga"
        static let ApiPort = 3000
        static let ApiPath = "/"
    }
    
    struct ParameterKey {
        static let LimitTime = "arrival_time"
        static let UserLocation = "user_loc"
        static let HomeLocation = "home_loc"
    }
    
    struct JsonResponseKeys {
        static let PathResults = "result"
        static let ResultType = "type"
    }
    
}
