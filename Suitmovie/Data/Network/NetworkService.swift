//
//  NetworkService.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService: NetworkServiceProtocol {
            
    func get(path: String, parameters: [String: Any]?, headers: [String: String]?, onSuccess: @escaping (Data?) -> Void, onError: @escaping (Error?) -> Void) {
        
        var urlComponents = BaseURL.url
        urlComponents.path = path
        
        let url = urlComponents.url?.absoluteString ?? ""
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(_):
                guard let data = response.data else {
                    onError(NetworkHelper.customError(code: 401, message: ConstantsWording.pleaseTryAgain))
                    return
                }
                onSuccess(data)

            case .failure(_):
                onError(response.result.error)
            }
        }
    }
}
