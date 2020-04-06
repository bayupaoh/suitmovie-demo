//
//  FavoriteMovieViewViewModel.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 28/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation
import SwiftUI

class FavoriteMovieViewViewModel: ObservableObject {
    
    private var movieRepository: MovieRepositoryProtocol
    @Published var error: String? = nil
    @Published var isLoading = false
    @Published var movies: [Movie] = []
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository(networkService: NetworkService(), localService: MovieLocalService())) {
        self.movieRepository = movieRepository
    }

    func fetchFavoriteMovie() {
        self.movies = []
        self.error = nil
        self.isLoading = true
        
        movieRepository.listFavoriteMovie(onSuccess: { [unowned self] movies in
            self.isLoading = false
            if movies.count == 0 {
                self.error = ConstantsWording.dataNotFound
            } else {
                self.movies = movies
            }
        }) { [unowned self] error in
            self.isLoading = false
            self.error = error?.localizedDescription
        }
    }
}
