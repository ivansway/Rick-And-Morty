//
//  CharactersView.swift
//  Rick And Morty
//
//  Created by Ivan Myrza on 22.02.2025.
//

import SwiftUI

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading characters...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.characters) { character in
                        CharacterRow(character: character)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Characters")
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}



#Preview {
    CharactersView()
}
