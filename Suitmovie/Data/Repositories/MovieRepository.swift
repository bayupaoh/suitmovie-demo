//
//  MovieRepository.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation
import Alamofire

class MovieRepository: MovieRepositoryProtocol {
    
    private var networkService: NetworkServiceProtocol
    private var localService: LocalServiceProtocol
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()

    private let apiKey = "7b9a9c338b6d93043d12922e317605f1"
    
//    init(networkService: NetworkServiceProtocol) {
//        self.networkService = networkService
//    }
    
    init(networkService: NetworkServiceProtocol, localService: LocalServiceProtocol) {
        self.networkService = networkService
        self.localService = localService
    }
    
    func listMovie(category: Category, page: Int, onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (Error?) -> Void) {
        
        var path: String {
            switch category {
            case .popular:
                return "popular"
            case .upcoming:
                return "upcoming"
            case .topRated:
                return "top_rated"
            case .nowPlaying:
                return "now_playing"
            }
        }
        let parameters: [String: Any] = [
            "api_key": apiKey,
            "page": page,
            "language": Locale.current.languageCode ?? "en"
        ]

        networkService.get(path: "/3/movie/\(path)", parameters: parameters, headers: nil, onSuccess: { [unowned self] data in
            if let response = data {
                do {
                    let movieResponse = try self.jsonDecoder.decode(MoviesResponse.self, from: response)
                    onSuccess(movieResponse.results)
                } catch {
                    onError(NetworkHelper.customError(code: 402, message: ConstantsWording.sorryErrorOurSystem))
                }
            } else {
                onError(NetworkHelper.customError(code: 402, message: ConstantsWording.sorryErrorOurSystem))
            }
        }) { error in
            onError(error)
        }
    }
    
    func listReview(idMovie: Int, page: Int, onSuccess: @escaping ([Review]) -> Void, onError: @escaping (Error?) -> Void) {
        
        let parameters: [String: Any] = [
            "api_key": apiKey,
            "page": page,
            "language": Locale.current.languageCode ?? "en"
        ]

        networkService.get(path: "/3/movie/\(idMovie)/reviews", parameters: parameters, headers: nil, onSuccess: { [unowned self] data in
            if let response = data {
                do {
                    let reviewResponse = try self.jsonDecoder.decode(ReviewsResponse.self, from: response)
                    onSuccess(reviewResponse.results)
                } catch {
                    onError(NetworkHelper.customError(code: 402, message: ConstantsWording.sorryErrorOurSystem))
                }
            } else {
                onError(NetworkHelper.customError(code: 402, message: ConstantsWording.sorryErrorOurSystem))
            }
        }) { error in
            onError(error)
        }
    }
    
    func addFavorite(movie: Movie, onSuccess: @escaping (String) -> Void, onError: @escaping (Error?) -> Void) {
        localService.insert(movie: movie, onSuccess: {
            onSuccess("")
        }) { error in
            onError(error)
        }
    }
    
    func removeFavorite(movie: Movie, onSuccess: @escaping (String) -> Void, onError: @escaping (Error?) -> Void) {
        localService.delete(movie: movie, onSuccess: {
            onSuccess("")
        }) { error in
            onError(error)
        }
    }
    
    func checkFavorite(movie: Movie, onSuccess: @escaping (Bool) -> Void, onError: @escaping (Error?) -> Void) {
        localService.fetch(movie: movie, onSuccess: { movie in
            onSuccess(true)
        }) { error in
            onError(error)
        }
    }

    func listFavoriteMovie(onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (Error?) -> Void) {
        localService.fetch(onSuccess: { movies in
            onSuccess(movies ?? [Movie]())
        }) { error in
            onError(error)
        }
    }
}
