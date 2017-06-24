//
//  LocalSearchConstant.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 23..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

// static information for communication
// 네이버 지역 검색 : https://developers.naver.com/docs/search/local/
extension LocalSearchClient {
    
    struct Constants {
        
        static let ApiScheme = "https"
        static let ApiHost = "openapi.naver.com"
        static let ApiPath = "/v1"
        
        static let ClientId = "vGx5yOs21x8vx0eGnQqu"
        static let ClientSecretKey = "9WkMD95UBc"
        
    }
    
    struct Methods {
        
        static let SearchJson = "/search/local.json"
        
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        
        static let Query = "query"
        static let Display = "display"
        static let Start = "start"
        static let Sort = "sort"
        
    }
    
    // MARK: JSON Body Keys
    struct HeaderFieldKeys {
        
        static let XNaverClientId = "X-Naver-Client-Id"
        static let XNaverClientSecret = "X-Naver-Client-Id"
        
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        
    }
    
}
