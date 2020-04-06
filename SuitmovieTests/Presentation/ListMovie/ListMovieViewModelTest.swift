//
//  ListMovieViewModelTest.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 29/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import XCTest

@testable import Suitmovie
class ListMovieViewModelTest: XCTestCase {
    
    let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_popular", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))

    let movieRepositoryFailed = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_popular", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchMovieSuccess() {
        let listMovieViewViewModel = ListMovieViewViewModel(movieRepository: movieRepositorySuccess)
        listMovieViewViewModel.fetchMovie(category: .popular, page: 1)
        XCTAssertEqual(listMovieViewViewModel.isLoading, false)
        XCTAssertEqual(listMovieViewViewModel.movies.first?.title, "Sonic the Hedgehog")
        XCTAssertNil(listMovieViewViewModel.error)
    }

    func testFetchMovieFailed() {
        let listMovieViewViewModel = ListMovieViewViewModel(movieRepository: movieRepositoryFailed)
        listMovieViewViewModel.fetchMovie(category: .popular, page: 1)
        XCTAssertEqual(listMovieViewViewModel.isLoading, false)
        XCTAssert(listMovieViewViewModel.movies.count == 0)
        XCTAssertNotNil(listMovieViewViewModel.error)
    }
}
