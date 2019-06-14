//
//  Movie.swift
//  MoviesOnSwift
//
//  Created by Gaston Daniel Gabriel Grippi on 12/06/2019.
//  Copyright © 2019 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

struct Movie : Codable {
    var title: String
    var genres : [Int]
    var description: String

    enum CodingKeys: String, CodingKey {
        case title
        case genres = "genre_ids"
        case description = "overview"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        genres = try values.decode([Int].self, forKey: .genres)
        description = try values.decode(String.self, forKey: .description)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(genres, forKey: .genres)
        try container.encode(description, forKey: .description)
    }
    
}

