//
//  NetworkServiceSuccessMock.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 29/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

class NetworkServiceMock: NetworkServiceProtocol {
    
    var fileName: String
    var isSuccess: Bool
    let errorMock = NSError(domain: "Kitamovie", code: 400, userInfo: [NSLocalizedDescriptionKey: "error"])
    
    init(fileName: String, isSuccess: Bool) {
        self.fileName = fileName
        self.isSuccess = isSuccess
    }
    
    func get(path: String, parameters: [String: Any]?, headers: [String: String]?, onSuccess: @escaping (Data?) -> Void, onError: @escaping (Error?) -> Void) {
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let stubData = contents.data(using: String.Encoding.utf8)
                if isSuccess {
                    onSuccess(stubData)
                } else {
                    onError(errorMock)
                }
            } catch {
                onError(error)
            }
        }
    }
}
