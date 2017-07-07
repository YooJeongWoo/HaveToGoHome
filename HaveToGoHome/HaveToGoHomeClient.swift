//
//  HaveToGoHomeClient.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 23..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import Foundation

// MARK: - Local Search Client
class HaveToGoHomeClient :NSObject {
    
    // shared session
    var session = URLSession.shared
  
    override init() {
        super.init()
    }
    
    // MARK: task for get method
    func taskFotGetMethod (_ method: String, parameter: [String:AnyObject], completionHandler: @escaping(_ result: AnyObject?, _ error: NSError?) -> Void ) -> URLSessionDataTask {
        
        let request = NSMutableURLRequest(url: htghURLFromParameters(parameter, withPathExtension: method))
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            // make task with completion Handler
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandler(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard data != nil else {
                sendError("No data was returned by the request!")
                return
            }
            
            self.convertDataWithCompletionHandler(data!, completionHandlerForConvertData: completionHandler)

        }
        
        task.resume()
        
        return task
    }
    
    // MARK: shared instance
    class func singleton () -> HaveToGoHomeClient {
        struct Singleton {
            static var sharedInstance = HaveToGoHomeClient()
        }
        return Singleton.sharedInstance
    }
    
    // create a URL from parameters
    private func htghURLFromParameters(_ parameters: [String:AnyObject], withPathExtension: String? = nil) -> URL {
        
        var components = URLComponents()
        components.scheme = HaveToGoHomeClient.Constants.ApiScheme
        components.host = HaveToGoHomeClient.Constants.ApiHost
        components.path = HaveToGoHomeClient.Constants.ApiPath + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        components.port = HaveToGoHomeClient.Constants.ApiPort
        
        print(components.url)
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
    
    // given raw JSON, return a usable Foundation object
    private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        var parsedResult: AnyObject! = nil
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandlerForConvertData(parsedResult, nil)
    }
    
}
