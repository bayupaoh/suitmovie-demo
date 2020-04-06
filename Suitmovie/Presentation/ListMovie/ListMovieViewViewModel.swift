//
//  ListMovieViewViewModel.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 27/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation
import SwiftUI

final class ListMovieViewViewModel: ObservableObject {
    
    private var movieRepository: MovieRepositoryProtocol
    @Published var error: String? = nil
    @Published var isLoading = false
    @Published var movies: [Movie] = []
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository(networkService: NetworkService(), localService: MovieLocalService())) {
        self.movieRepository = movieRepository
    }
    
    func fetchMovie(category: Category, page: Int) {
        if page == 1 {
            self.movies = []
            self.error = nil
            self.isLoading = true
        }
        movieRepository.listMovie(category: category, page: page, onSuccess: { [unowned self] response in
            if page == 1 {
                self.isLoading = false
                self.movies.removeAll()
                self.movies = response
            } else {
                self.movies.append(contentsOf: response)
            }
        }) { [unowned self] error in
            if page == 1 {
                self.isLoading = false
                self.error = error?.localizedDescription
            }
        }
    }
}
