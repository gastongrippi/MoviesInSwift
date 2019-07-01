//
//  MoviesTableView.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 12/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MoviesView : UIView {

// MARK: - Properties
    
    var tableView = UITableView()
    var moviesControllerDelegate : MoviesControllerDelegate?
    
// MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView = UITableView.init(frame: .zero)
        // Add table
        self.addSubview(tableView)
        // Configure constraints
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        // set delegates
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - public methods
    
    func setDelegate(delegate: MoviesControllerDelegate) {
        moviesControllerDelegate = delegate
    }
    
}
