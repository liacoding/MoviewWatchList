//
//  ContentView.swift
//  MovieWatchList
//
//  Created by Olga Nazarov on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieListViewModel()
    @State private var showingAddMovie = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    MovieRow(movie: movie, onToggleWatched: {
                        viewModel.toggleWatched(for: movie)
                    })
                }
            }
            .navigationTitle("Movie Watchlist")
            .toolbar {
                Button(action: { showingAddMovie = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddMovie) {
                AddMovieView(viewModel: viewModel)
            }
        }
    }
}

struct MovieRow: View {
    let movie: Movie
    let onToggleWatched: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(movie.title).font(.headline)
                Text(movie.director).font(.subheadline)
                Text(String(movie.releaseYear)).font(.caption)  // Changed this line
            }
            Spacer()
            Button(action: onToggleWatched) {
                Image(systemName: movie.watched ? "eye.fill" : "eye")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
