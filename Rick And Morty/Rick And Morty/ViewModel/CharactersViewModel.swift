//
//  CharactersViewModel.swift
//  Rick And Morty
//
//  Created by Ivan Myrza on 22.02.2025.
//

import SwiftUI
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters: [RMCharacter] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    private let networkService = NetworkService()
}

extension CharactersViewModel {
    
    func fetchCharacters() {
        isLoading = true
        errorMessage = nil
        
        networkService.fetchAllCharacters { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let characters):
                    self?.characters = characters
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
