//
//  Movie.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

public struct MoviesResponse: Codable {
    public let page: Int
    public let results: [Movie]
}

public struct Movie: Codable, Identifiable  {
    
    public let id: Int
    public let title: String
    public let backdropPath: String?
    public let posterPath: String?
    public let overview: String?
    public let releaseDate: String?
    public let adult: Bool
    
//    private enum CodingKeys: String, CodingKey{
//        case id, title, backdropPath = "backdrop_path", posterPath = "poster_path", overview, releaseDate = "release_date", adult
//    }

    public var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }

    public var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
}

extension Movie {
    
    static var fakes: [Movie] {
        return [
            Movie.fake,
            Movie.fake,
            Movie.fake,
            Movie.fake
        ]
    }
    
    static var fake: Movie {
        Movie(id: 23, title: "Aladin", backdropPath: nil, posterPath: nil, overview: "Good movie for family Good movie for familyGood movie for familyGood movie for familyGood movie for familyGood movie for familyGood movie for family", releaseDate: "22-11-2020", adult: true)
    }
    
}
