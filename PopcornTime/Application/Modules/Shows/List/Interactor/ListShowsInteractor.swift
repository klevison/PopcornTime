//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class ListShowsInteractor: ListShowsInteractorCommandProtocol {
    
    weak var presenter: ListShowsInteractorQueryProtocol?
    var apiDataManager: ListShowsAPIDataManagerCommandProtocol?
    var localDatamanager: ListShowsLocalDataManagerCommandProtocol?
    
    init() {
        apiDataManager = ListShowsAPIDataManager()
        localDatamanager = ListShowsLocalDataManager()
    }
    
    func getShowById(id: String) {
        apiDataManager?.getShowById(id, completion: { (show: Show?, errorTyper: ErrorType?) -> () in
            self.presenter?.showLoaded(show)
        })
    }
    
    func getShowsByPage(page: Int) {
        apiDataManager?.getShowsByPage(page, completion: { (show: [Show]?, errorType: ErrorType?) -> () in
            self.presenter?.allShowsLoaded(show)
        })
    }
    
}