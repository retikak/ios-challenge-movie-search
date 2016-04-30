//
//  Movie.swift
//  MovieSearch
//
//  Created by Retika Kumar on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit
class Movie {
    
    private let kImageBaseURl = "http://image.tmdb.org/t/p/w500"
    
    private let kid = "id"
    private let ktitle = "title"
    private let ksummary = "overview"
    private let kvoteAverage = "vote_average"
    private let kposterPath = "poster_path"
    
    var id :Float
    var title:String
    var voteAverage:Float
    var summary:String
    var posterUrl: String
    
    init? (dictionary: [String:AnyObject]) {
        guard let id = dictionary[kid] as? Float,
        title = dictionary[ktitle] as? String,
        summary = dictionary[ksummary] as? String,
        voteAverage = dictionary[kvoteAverage] as? Float,
        posterPath = dictionary[kposterPath] as? String else {return nil}
        
        self.id = id
        self.title = title
        self.summary = summary
        self.voteAverage = voteAverage
        self.posterUrl = kImageBaseURl + posterPath
    }
}
