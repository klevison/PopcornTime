//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class ListShowsPresenter: ListShowsPresenterProtocol, ListShowsInteractorQueryProtocol {
    
    weak var view: ListShowsViewProtocol?
    var interactor: ListShowsInteractorCommandProtocol?
    
    init(view: ListShowsViewProtocol) {
        self.view = view
        interactor = ListShowsInteractor()
        interactor?.presenter = self
    }
    
    func getShowById(id: String) {
        interactor?.getShowById(id)
    }
    
    func getShowsByPage(page: Int) {
        interactor?.getShowsByPage(1)
    }
    
    func allShowsLoaded(shows: [Show]?) {
        view?.showsLoaded(shows)
    }
    
    func showLoaded(show: Show?) {
        view?.showLoaded(show)
    }

}