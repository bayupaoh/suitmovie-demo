//
//  MovieRepositoriesProtocol.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

protocol MovieRepositoryProtocol {
    func listMovie(category: Category, page: Int, onSuccess: @escaping (_ result: [Movie]) -> Void, onError: @escaping (_ error: Error?) -> Void)

    func listReview(idMovie: Int, page: Int, onSuccess: @escaping (_ result: [Review]) -> Void, onError: @escaping (_ error: Error?) -> Void)
    
    func addFavorite(movie: Movie, onSuccess: @escaping (_ message: String) -> Void, onError: @escaping (_ error: Error?) -> Void)
    
    func removeFavorite(movie: Movie, onSuccess: @escaping (_ message: String) -> Void, onError: @escaping (_ error: Error?) -> Void)
    
    func checkFavorite(movie: Movie, onSuccess: @escaping (_ result: Bool) -> Void, onError: @escaping (_ error: Error?) -> Void)
    
    func listFavoriteMovie(onSuccess: @escaping (_ result: [Movie]) -> Void, onError: @escaping (_ error: Error?) -> Void)
}
