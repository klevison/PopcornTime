//
//  ShowRestClient.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/7/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias showCompletion = ((Show?, ErrorType?) -> ())?
typealias showColectionCompletion = (([Show]?, ErrorType?) -> ())?

protocol ShowService {
    
    func getById(id: String, completion: showCompletion)
    func getByPage(page: Int, completion: showColectionCompletion)
    
}

class ShowRestClient: ShowService {
    
    func getById(id: String, completion: showCompletion) {
        let url = "http://eztvapi.re/show/\(id)"
        Alamofire.request(.GET, url, parameters: nil)
            .responseObject { (show: Show?, errorType: ErrorType?) in
                completion?(show, errorType)
        }
    }
    
    func getByPage(page: Int, completion: showColectionCompletion) {
        let url = "http://eztvapi.re/shows/\(page)"
        Alamofire.request(.GET, url, parameters: nil)
            .responseArray { (shows: [Show]?, errorType: ErrorType?) in
                completion?(shows, errorType)
        }
    }
    
}