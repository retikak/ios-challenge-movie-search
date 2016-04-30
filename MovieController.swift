//
//  MovieController.swift
//  MovieSearch
//
//  Created by Retika Kumar on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit


class MovieController {
    
    
    
    //https://api.themoviedb.org/3/movie/550?api_key=f3d1cc9b9b8ca07779c67ad49df32cb0//
    
    
    static let baseurl = "http://api.themoviedb.org/3"
    static let api_key = "f3d1cc9b9b8ca07779c67ad49df32cb0"
    
    
    static func getMovieFromSearchTerm (searchTerm:String, completion:(movies: [Movie])->Void){
        var movieUrlString = MovieController.baseurl + "/search/movie"
        movieUrlString = movieUrlString + "?" + "api_key=" + MovieController.api_key
        movieUrlString = movieUrlString + "&" + "query=" + searchTerm
        
        if let url = NSURL(string: movieUrlString) {
            NetworkController.dataAtURL(String(url), completion: { (data) in
                if let data = data, let jsonDictionary = NetworkController.jsonWithReturn(data), let resultsArray = jsonDictionary["results"] as? [[String:AnyObject]] {
                    var movies = [Movie] ()
                    for resultDictionary in resultsArray{
                        if let movie = Movie(dictionary: resultDictionary) {
                            movies.append(movie)
                        }
                    }
                   completion(movies: movies)
                } else {
                    completion(movies: [])
                }
            })
            
        } else {
            completion(movies: [])
        }
    }
}



