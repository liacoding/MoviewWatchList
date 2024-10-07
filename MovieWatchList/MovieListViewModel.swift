//
//  MovieListViewModel.swift
//  MovieWatchList
//
//  Created by Olga Nazarov on 10/7/24.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        loadMovies()
    }
    
    func loadMovies() {
        // In a real app, you might load data from a database or API
        movies = [
            Movie(title: "Harry Potter", director: "Chris Columbus", releaseYear: 2001),
            Movie(title: "Joker", director: "Todd Phillips", releaseYear: 2024),
            Movie(title: "Interstellar", director: "Christopher Nolan", releaseYear: 2014)
        ]
    }
    
    func addMovie(_ movie: Movie) {
        movies.append(movie)
    }
    
    func toggleWatched(for movie: Movie) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].watched.toggle()
        }
    }
}
