//
//  NetworkHelper.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

class NetworkHelper {
    
    static func customError(code: Int, message: String) -> Error {
        return NSError(domain: "Kitamovie", code: code, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
