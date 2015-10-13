//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

final class ListShowsViewController: UITableViewController {
    
    var presenter: ListShowsPresenterProtocol?
    var shows = [Show]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ListShowsPresenter(view: self)
        presenter?.getShowsByPage(1)
        //presenter?.getShowById("tt1475582")
    }
    
    
}

extension ListShowsViewController: ListShowsViewProtocol {
    
    func showsLoaded(shows: [Show]?) {
        if shows != nil {
            self.shows = shows!
            tableView.reloadData()
        }
    }
    
    func showLoaded(show: Show?) {
        if show != nil {
            print(show)
        }
    }

}

extension ListShowsViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID")
        let show = shows[indexPath.row]
        cell?.textLabel?.text = show.id
        return cell!
    }

}

