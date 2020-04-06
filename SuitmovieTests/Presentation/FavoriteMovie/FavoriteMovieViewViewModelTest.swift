//
//  FavoriteMovieViewViewModelTest.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 29/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import XCTest

class FavoriteMovieViewViewModelTest: XCTestCase {

    let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_popular", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))

    let movieRepositoryFailed = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_popular", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchFavoriteMovieSuccess() {
        let favoriteViewModel = FavoriteMovieViewViewModel(movieRepository: movieRepositorySuccess)
        favoriteViewModel.fetchFavoriteMovie()
        XCTAssert(favoriteViewModel.movies.count > 0)
        XCTAssertEqual(favoriteViewModel.isLoading, false)
        XCTAssertNil(favoriteViewModel.error)
    }

    func testFetchFavoriteMovieFailed() {
        let favoriteViewModel = FavoriteMovieViewViewModel(movieRepository: movieRepositoryFailed)
        favoriteViewModel.fetchFavoriteMovie()
        XCTAssert(favoriteViewModel.movies.count == 0)
        XCTAssertEqual(favoriteViewModel.isLoading, false)
        XCTAssertNotNil(favoriteViewModel.error)
    }
}
