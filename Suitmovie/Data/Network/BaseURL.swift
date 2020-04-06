//
//  BaseURL.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case dev
    case production
}

open class BaseURL: NSObject {
    
    public static var url: URLComponents {
        switch stage {
        case .dev:
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "api.themoviedb.org"
            return urlComponents
        case .production:
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "api.themoviedb.org"
            return urlComponents
        }
    }
    
    static let stage: NetworkEnvironment = .dev
}
