//
//  DetailMovieViewViewModel.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 27/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire

class DetailMovieViewViewModel: ObservableObject {
    
    private var movieRepository: MovieRepositoryProtocol
    @Published var error: String? = nil
    @Published var isLoading = false
    @Published var reviews: [Review] = []
    @Published var isFavorite = false
    @Published var isShowAlert: Bool = false
    @Published var messageAlert: String? = nil

    init(movieRepository: MovieRepositoryProtocol = MovieRepository(networkService: NetworkService(), localService: MovieLocalService())) {
        self.movieRepository = movieRepository
    }
    
    func fetchReview(idMovie: Int, page: Int) {
        
        if page == 1 {
            self.reviews = []
            self.error = nil
            self.isLoading = true
        }
        movieRepository
            .listReview(idMovie: idMovie, page: page, onSuccess: { [unowned self] response in
                if page == 1 {
                    self.isLoading = false
                    if response.count == 0 {
                        self.error = ConstantsWording.revieNotAvailable
                    } else {
                        self.reviews.removeAll()
                        self.reviews = response
                    }
                } else {
                    self.reviews.append(contentsOf: response)
                }
            }) { [unowned self] error in
                if page == 1 {
                    self.isLoading = false
                    self.error = error?.localizedDescription
                }
        }
    }
    
    func addFavorite(movie: Movie) {
        self.isShowAlert = false
        movieRepository.addFavorite(movie: movie, onSuccess: { [unowned self] message in
            self.isFavorite = true
        }) { error in
            self.isShowAlert = true
            self.messageAlert = error?.localizedDescription
        }
    }
    
    func removeFavorite(movie: Movie) {
        self.isShowAlert = false
        movieRepository.removeFavorite(movie: movie, onSuccess: { [unowned self] message in
            self.isFavorite = false
        }) { error in
            self.isShowAlert = true
            self.messageAlert = error?.localizedDescription
        }
    }
    
    func checkFavorite(movie: Movie) {
        self.isShowAlert = false
        movieRepository.checkFavorite(movie: movie, onSuccess: { [unowned self] result in
            self.isFavorite = result
        }) { error in
            self.isFavorite = false
        }
    }
}
