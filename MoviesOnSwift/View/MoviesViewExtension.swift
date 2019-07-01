//
//  MoviewViewExtension.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 18/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

extension MoviesView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesControllerDelegate?.getMoviesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "movieCell")
        cell.textLabel?.text = moviesControllerDelegate?.getMovieTitle(row: indexPath.row)
        return cell
    }
    
}
