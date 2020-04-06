//
//  MovieLocalServiceSuccessMock.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 29/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

class MovieLocalServiceMock: LocalServiceProtocol {
    
    var isSuccess: Bool
    let errorMock = NSError(domain: "Kitamovie", code: 400, userInfo: [NSLocalizedDescriptionKey: "error"])
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func fetch(onSuccess: @escaping ([Movie]?) -> Void, onError: @escaping (Error?) -> Void) {
        if isSuccess {
            onSuccess(Movie.fakes)
        } else {
            onError(errorMock)
        }
    }
    
    func fetch(movie: Movie, onSuccess: @escaping (Movie) -> Void, onError: @escaping (Error?) -> Void) {
        if isSuccess {
            onSuccess(Movie.fake)
        } else {
            onError(errorMock)
        }
    }
    
    func insert(movie: Movie, onSuccess: @escaping () -> Void, onError: @escaping (Error?) -> Void) {
        if isSuccess {
            onSuccess()
        } else {
            onError(errorMock)
        }
    }
    
    func delete(movie: Movie, onSuccess: @escaping () -> Void, onError: @escaping (Error?) -> Void) {
        if isSuccess {
            onSuccess()
        } else {
            onError(errorMock)
        }
    }
}
