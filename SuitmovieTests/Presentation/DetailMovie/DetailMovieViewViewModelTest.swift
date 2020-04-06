//
//  DetailMovieViewViewModelTest.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 29/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import XCTest

class DetailMovieViewViewModelTest: XCTestCase {

    let movieRepositorySuccess = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_review", isSuccess: true), localService: MovieLocalServiceMock(isSuccess: true))

    let movieRepositoryFailed = MovieRepository(networkService: NetworkServiceMock(fileName: "response_movie_review", isSuccess: false), localService: MovieLocalServiceMock(isSuccess: false))
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchReviewSuccess() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositorySuccess)
        
        detailMovieViewModel.fetchReview(idMovie: 1, page: 1)
        XCTAssert(detailMovieViewModel.reviews.count > 0)
        XCTAssertEqual(detailMovieViewModel.isLoading, false)
        XCTAssertNil(detailMovieViewModel.error)
    }
    
    func testFetchReviewFailed() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositoryFailed)
        
        detailMovieViewModel.fetchReview(idMovie: 1, page: 1)
        XCTAssert(detailMovieViewModel.reviews.count == 0)
        XCTAssertEqual(detailMovieViewModel.isLoading, false)
        XCTAssertNotNil(detailMovieViewModel.error)
    }
    
    func testAddFavoriteSuccess() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositorySuccess)
        
        detailMovieViewModel.addFavorite(movie: Movie.fake)
        XCTAssert(detailMovieViewModel.isFavorite)
    }
    
    func testAddFavoriteFailed() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositoryFailed)
        
        detailMovieViewModel.addFavorite(movie: Movie.fake)
        XCTAssert(!detailMovieViewModel.isFavorite)
        XCTAssert(detailMovieViewModel.isShowAlert)
        XCTAssertNotNil(detailMovieViewModel.messageAlert)
    }
    
    func testRemoveFavoriteSuccess() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositorySuccess)
        
        detailMovieViewModel.removeFavorite(movie: Movie.fake)
        XCTAssert(!detailMovieViewModel.isFavorite)
        XCTAssert(!detailMovieViewModel.isShowAlert)
        XCTAssertNil(detailMovieViewModel.messageAlert)
    }

    func testRemoveFavoriteFailed() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositoryFailed)
        
        detailMovieViewModel.removeFavorite(movie: Movie.fake)
        XCTAssert(detailMovieViewModel.isShowAlert)
        XCTAssertNotNil(detailMovieViewModel.messageAlert)
    }
    
    func testCheckFavoriteSuccess() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositorySuccess)
        
        detailMovieViewModel.checkFavorite(movie: Movie.fake)
        XCTAssert(detailMovieViewModel.isFavorite)
        XCTAssert(!detailMovieViewModel.isShowAlert)
        XCTAssertNil(detailMovieViewModel.messageAlert)
    }
    
    func testCheckFavoriteFailed() {
        let detailMovieViewModel = DetailMovieViewViewModel(movieRepository: movieRepositoryFailed)
        
        detailMovieViewModel.checkFavorite(movie: Movie.fake)
        XCTAssert(!detailMovieViewModel.isFavorite)
    }
}
