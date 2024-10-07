//
//  AddMovieView.swift
//  MovieWatchList
//
//  Created by Olga Nazarov on 10/7/24.
//

import SwiftUI

struct AddMovieView: View {
    @ObservedObject var viewModel: MovieListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var director = ""
    @State private var releaseYear = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                    .accessibility(identifier: "Title")
                TextField("Director", text: $director)
                    .accessibility(identifier: "Director")
                TextField("Release Year", text: $releaseYear)
                    .keyboardType(.numberPad)
                    .accessibility(identifier: "Year")
            }
            .navigationTitle("Add Movie")
            .toolbar {
                Button("Save") {
                    if let year = Int(releaseYear) {
                        let newMovie = Movie(title: title, director: director, releaseYear: year)
                        viewModel.addMovie(newMovie)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .accessibility(identifier: "Save")
            }
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView(viewModel: MovieListViewModel())
    }
}
