//
//  NetworkController.swift
//  MovieSearch
//
//  Created by Retika Kumar on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    // Fetches data from URL!!!
    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: url) else {completion(data: nil); return}
        
        // Goes to URL and retrieves data from the URL
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(data: nil)
            } else {
                if let data = data {
                    completion(data: data)
                } else {
                    print("No data return from network request")
                    completion(data: nil)
                }
            }
        }
        task.resume()
    }
    
    static func jsonWithReturn(data: NSData) -> [String: AnyObject]? {
        return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
    }
}

    