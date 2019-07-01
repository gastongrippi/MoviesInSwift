//
//  ViewController.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 07/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Alamofire

class MoviesController: UIViewController {

    // MARK: - Properties
    let baseUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key="
    let apiKey = "208ca80d1e219453796a7f9792d16776"
    var movies = [Movie]()
    var moviesView : MoviesView?

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        moviesView = MoviesView(frame: .zero)
        moviesView?.setDelegate(delegate: self)
        self.view = moviesView
        self.title = "Lista de peliculas"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load initial API data
        loadTopRatedMovies(endpoint: baseUrl+apiKey)
    }
    
    // MARK: - private methods
    func loadTopRatedMovies(endpoint: String) -> Void {
        MoviesManager.shared.makeMovieRequestWithURL(endpoint,success: { DefaultDataResponse in
            let jsonResult = try? JSONSerialization.jsonObject(with: DefaultDataResponse.data!, options: []) as? [String:AnyObject]
            
            if let results = jsonResult?["results"] as? [Any] {
                for movieObject in results {
                    let jsonData = try? JSONSerialization.data(withJSONObject: movieObject, options: .prettyPrinted)
                    if let movie = try? JSONDecoder().decode(Movie.self, from: jsonData!) {
                        print(movie.title)
                        self.movies.append(movie)
                    }
                }
                self.moviesView?.tableView.reloadData()
            }
        })
    }

}
