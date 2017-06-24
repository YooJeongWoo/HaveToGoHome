//
//  LocalSearchClient.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 23..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import Foundation

// MARK: - Local Search Client
class LocalSearchClient: NSObject {
    
    // shared session
    var session = URLSession.shared
    
    func test () {
        let url = NSURL(string: "https://openapi.naver.com/v1/search/local.xml?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&sort=random")
        
        let request = NSMutableURLRequest(url: url as! URL)
        request.httpMethod = "POST"
        request.addValue(Constants.ClientId, forHTTPHeaderField: HeaderFieldKeys.XNaverClientId)
        request.addValue(Constants.ClientSecretKey, forHTTPHeaderField: HeaderFieldKeys.XNaverClientSecret)
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
        }
        
        task.resume()
        
    }
    
    override init() {
        super.init()
    }
    
    
    // MARK: shared instance
    class func singleton () -> LocalSearchClient {
        struct Singleton {
            static var sharedInstance = LocalSearchClient()
        }
        return Singleton.sharedInstance
    }
    
}
