//
//  SearchTableViewController.swift
//  MovieSearch
//
//  Created by Retika Kumar on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    var searchedMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchedMovies.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)  as! MovieCustomTableViewCell
        let movie = searchedMovies[indexPath.row]
        cell.updatWithMovie(movie)
        
        
        return cell
    }
    
    //MARK: - SearchBarDelegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let searchTerm = searchBar.text ?? ""
        MovieController.getMovieFromSearchTerm(searchTerm) { (movies) in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.searchedMovies = movies
                self.tableView.reloadData()
            })
        }
    }
}