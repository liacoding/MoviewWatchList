//
//  MovieWatchListTests.swift
//  MovieWatchListTests
//
//  Created by Olga Nazarov on 10/7/24.
//

import XCTest
@testable import MovieWatchList

class MovieWatchlistTests: XCTestCase {
    
    func testMovieInitialization() {
        let movie = Movie(title: "Inception", director: "Christopher Nolan", releaseYear: 2010)
        XCTAssertEqual(movie.title, "Inception")
        XCTAssertEqual(movie.director, "Christopher Nolan")
        XCTAssertEqual(movie.releaseYear, 2010)
        XCTAssertFalse(movie.watched)
    }
    
    func testMovieListViewModelInitialization() {
        let viewModel = MovieListViewModel()
        XCTAssertFalse(viewModel.movies.isEmpty, "MovieListViewModel should initialize with some movies")
    }
    
    func testAddMovie() {
        let viewModel = MovieListViewModel()
        let initialCount = viewModel.movies.count
        
        let newMovie = Movie(title: "Test Movie", director: "Test Director", releaseYear: 2023)
        viewModel.addMovie(newMovie)
        
        XCTAssertEqual(viewModel.movies.count, initialCount + 1, "Adding a movie should increase the count by 1")
        XCTAssertEqual(viewModel.movies.last?.title, "Test Movie", "The last movie should be the one we just added")
    }
}
