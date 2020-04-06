//
//  ReviwsResponse.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 27/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation

public struct ReviewsResponse: Codable {
    public let page: Int
    public let results: [Review]
}

public struct Review: Codable, Identifiable  {
    
    public let id: String
    public let author: String?
    public let content: String?
    public let url: String?
}
