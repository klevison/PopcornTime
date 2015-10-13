//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class ListShowsAPIDataManager: ListShowsAPIDataManagerCommandProtocol {
    
    let showRestClient: ShowService = ShowRestClient()
    
    func getShowById(id: String, completion: showCompletion) {
        showRestClient.getById(id) { (show: Show?, errorType: ErrorType?) -> () in
            if show != nil {
                completion?(show,nil)
            } else {
                completion?(nil,errorType)
            }
        }
    }
    
    func getShowsByPage(page: Int, completion: showColectionCompletion) {
        showRestClient.getByPage(page) { (show: [Show]?, errorType: ErrorType?) -> () in
            if show != nil {
                completion?(show,nil)
            } else {
                completion?(nil,errorType)
            }
        }
    }

    
}