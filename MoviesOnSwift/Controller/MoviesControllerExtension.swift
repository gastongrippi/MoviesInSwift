//
//  MoviesControllerExtension.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 25/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//

extension MoviesController : MoviesControllerDelegate {
    func getMoviesCount() -> Int {
        return self.movies.count
    }
    
    func getMovieTitle(row: Int) -> String {
        return self.movies[row].title
    }
}
