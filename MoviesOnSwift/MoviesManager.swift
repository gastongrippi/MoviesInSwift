//
//  MoviesAPIRequests.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 24/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//
import Alamofire

class MoviesManager {
    
    // MARK: - properties
    static let shared = MoviesManager()
    
    // MARK: - public methods
    
    func makeMovieRequestWithURL(_ endpoint: String, success: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(endpoint,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding(options:.prettyPrinted),
                          headers: nil).validate().responseJSON { DefaultDataResponse in
                            success(DefaultDataResponse)
        }
    }
}
