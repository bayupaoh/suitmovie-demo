//
//  NetworkServiceProtocol.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func get(path: String, parameters: [String: Any]?, headers: [String: String]?, onSuccess: @escaping (_ result: Data?) -> Void, onError: @escaping (_ error: Error?) -> Void)
}
