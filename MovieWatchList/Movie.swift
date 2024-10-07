//
//  Movie.swift
//  MovieWatchList
//
//  Created by Olga Nazarova on 10/7/24.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: UUID
    var title: String
    var director: String
    var releaseYear: Int
    var watched: Bool
    
    init(id: UUID = UUID(), title: String, director: String, releaseYear: Int, watched: Bool = false) {
        self.id = id
        self.title = title
        self.director = director
        self.releaseYear = releaseYear
        self.watched = watched
    }
}
