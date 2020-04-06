//
//  Constant.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 25/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

enum Category {
    case popular
    case upcoming
    case topRated
    case nowPlaying
}

struct ConstantsLists {
    static let categories = [
        CategoryMovie(id: 0, category: .popular, name: ConstantsWording.popular),
        CategoryMovie(id: 1, category: .upcoming, name: ConstantsWording.upcoming),
        CategoryMovie(id: 2, category: .topRated, name: ConstantsWording.topRated),
        CategoryMovie(id: 3, category: .nowPlaying, name: ConstantsWording.nowPlaying)
    ]
}

struct ConstantsWording {
    static let kitaMovie = NSLocalizedString("Kitamovie", comment: "")
    static let favoriteMovie = NSLocalizedString("Favorite Movie", comment: "")
    static let category = NSLocalizedString("Category", comment: "")
    static let popular = NSLocalizedString("Popular", comment: "")
    static let upcoming = NSLocalizedString("Upcoming", comment: "")
    static let topRated = NSLocalizedString("Top Rated", comment: "")
    static let nowPlaying = NSLocalizedString("Now Playing", comment: "")
    static let pleaseTryAgain = NSLocalizedString("Please try again", comment: "")
    static let sorryErrorOurSystem = NSLocalizedString("Sorry there is an error in our system. Please try again later", comment: "")
    static let thereAreNoMoviesAvailable = NSLocalizedString("There are no movies available", comment: "")
    static let thereAreNoReviewsAvailable = NSLocalizedString("There are no reviews available", comment: "")
    static let dataNotFound = NSLocalizedString("Data not found", comment: "")
    static let revieNotAvailable = NSLocalizedString("Review not available", comment: "")
}

struct ConstantsEntity {
    static let movieEntity = "MovieEntity"
    
    struct MovieEntity {
        static let id = "id"
        static let title = "title"
        static let backdropPath = "backdropPath"
        static let posterPath = "posterPath"
        static let overview = "overview"
        static let releaseDate = "releaseDate"
        static let adult = "adult"
        
    }
}
