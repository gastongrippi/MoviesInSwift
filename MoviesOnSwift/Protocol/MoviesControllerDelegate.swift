//
//  MoviesControllerDelegate.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 25/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//

protocol MoviesControllerDelegate {
    func getMoviesCount() -> Int
    func getMovieTitle(row: Int) -> String
}
