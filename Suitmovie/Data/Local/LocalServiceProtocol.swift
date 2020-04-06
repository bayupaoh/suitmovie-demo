//
//  LocalServiceProtocol.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 27/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

protocol LocalServiceProtocol {    
    func fetch(onSuccess: @escaping (_ result: [Movie]?) -> Void, onError: @escaping (_ error: Error?) -> Void)
    func fetch(movie: Movie, onSuccess: @escaping (_ result: Movie) -> Void, onError: @escaping (_ error: Error?) -> Void)
    func insert(movie: Movie, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void)
    func delete(movie: Movie, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void)
}
