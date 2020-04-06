//
//  MovieRepositoryTest.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 27/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import XCTest

@testable import Suitmovie

class MovieRepositoryTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testListMovieSuccess() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_popular", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))
        
        movieRepositorySuccess.listMovie(category: .popular, page: 1, onSuccess: { response in
            XCTAssertEqual("Sonic the Hedgehog", response.first?.title)
        }) { error in
            XCTAssertNil(error)
        }
    }
    
    func testListMovieError() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_popular", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
        
        movieRepositorySuccess.listMovie(category: .popular, page: 1, onSuccess: { response in
            XCTAssertNil(response)
        }) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testListReviewSuccess() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_review", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))
        
        movieRepositorySuccess.listReview(idMovie: 1, page: 1, onSuccess: { response in
            XCTAssertEqual("elshaarawy", response.first?.author)
        }) { error in
            XCTAssertNil(error)
        }
        
    }
    
    func testListReviewError() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_review", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
        
        movieRepositorySuccess.listReview(idMovie: 1, page: 1, onSuccess: { response in
                XCTAssertNil(response)
            }) { error in
                XCTAssertNotNil(error)
        }
    }
    
    func testAddFavoriteSuccess() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))
        
        movieRepositorySuccess.addFavorite(movie: Movie.fake, onSuccess: { message in
            XCTAssertNotNil(message)
        }) { error in
            XCTAssertNil(error)
        }
    }
    
    func testAddFavoriteFailed() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
        
        movieRepositorySuccess.addFavorite(movie: Movie.fake, onSuccess: { message in
            XCTAssertNil(message)
        }) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testRemoveFavoriteSuccess() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))
        
        movieRepositorySuccess.removeFavorite(movie: Movie.fake, onSuccess: { message in
            XCTAssertNotNil(message)
        }) { error in
            XCTAssertNil(error)
        }
    }
    
    func testRemoveFavoriteFailed() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
        
        movieRepositorySuccess.removeFavorite(movie: Movie.fake, onSuccess: { message in
            XCTAssertNil(message)
        }) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testCheckFavoriteSuccess() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))
        
        movieRepositorySuccess.checkFavorite(movie: Movie.fake, onSuccess: { response in
            XCTAssertEqual(response, true)
        }) { error in
            XCTAssertNil(error)
        }
    }
    
    func testCheckFavoriteFailed() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
        
        movieRepositorySuccess.checkFavorite(movie: Movie.fake, onSuccess: { response in
            XCTAssertEqual(response, false)
        }) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testListFavoriteMovieSuccess() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))
        
        movieRepositorySuccess.listFavoriteMovie(onSuccess: { response in
            XCTAssert(response.count > 0)
        }) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testListFavoriteMovieFailed() {
        let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
        
        movieRepositorySuccess.listFavoriteMovie(onSuccess: { response in
            XCTAssertNil(response)
        }) { (error) in
            XCTAssertNotNil(error)
        }
    }
}
