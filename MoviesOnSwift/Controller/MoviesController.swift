//
//  ViewController.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 07/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit
import Alamofire

class MoviesController: UIViewController {
    
    // MARK: - Properties
    let baseUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key="
    let apiKey = "208ca80d1e219453796a7f9792d16776"
    
    
    var topRatedMovies = [String:AnyObject]()
    var movies : [Movie]?

    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = MoviesView()
        self.title = "Lista de peliculas"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load initial API data
        makeRequestWithURL(baseUrl+apiKey)
    }
    
    
    // MARK: -

    func loadTopRatedMovies() {
        
    }
    
    func makeRequestWithURL(_ endpoint: String) -> Void {
        Alamofire.request(endpoint,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding(options:.prettyPrinted),
                          headers: nil).validate().responseJSON { (DefaultDataResponse) in

                            let jsonResult = try? JSONSerialization.jsonObject(with: DefaultDataResponse.data!, options: []) as? [String:AnyObject]
                            
                            if let results = jsonResult?["results"] as? [Any] {
                                let jsonData = try? JSONSerialization.data(withJSONObject: results[0], options: .prettyPrinted)
                                if let movie = try? JSONDecoder().decode(Movie.self, from: jsonData!) {
                                    print(movie.title)
                                }
                            }
        }
    }
        
}

