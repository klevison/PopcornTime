//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

protocol ListShowsViewProtocol: class {
    
    var presenter: ListShowsPresenterProtocol? { get set }
    
    func showsLoaded(shows: [Show]?)
    func showLoaded(show: Show?)
    
}

protocol ListShowsPresenterProtocol: class {
    
    var view: ListShowsViewProtocol? { get set }
    var interactor: ListShowsInteractorCommandProtocol? { get set }
    
    func getShowById(id: String)
    func getShowsByPage(page: Int)

}

protocol ListShowsInteractorQueryProtocol: class {
    
    func allShowsLoaded(shows: [Show]?)
    func showLoaded(show: Show?)
        
}

protocol ListShowsInteractorCommandProtocol: class {
    
    var presenter: ListShowsInteractorQueryProtocol? { get set }
    var apiDataManager: ListShowsAPIDataManagerCommandProtocol? { get set }
    var localDatamanager: ListShowsLocalDataManagerCommandProtocol? { get set }
    
    func getShowById(id: String)
    func getShowsByPage(page: Int)

}

protocol ListShowsDataManagerCommandProtocol: class {

}

protocol ListShowsAPIDataManagerCommandProtocol: class {
    
    func getShowById(id: String, completion: showCompletion)
    func getShowsByPage(page: Int, completion: showColectionCompletion)
    
}

protocol ListShowsLocalDataManagerCommandProtocol: class {
    
    func getShowById(id: String, completion: showCompletion)
    func getShowsByPage(page: Int, completion: showColectionCompletion)
    
}
