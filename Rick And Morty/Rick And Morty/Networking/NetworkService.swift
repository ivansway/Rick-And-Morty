//
//  NetworkService.swift
//  Rick And Morty
//
//  Created by Ivan Myrza on 22.02.2025.
//

import Foundation

class NetworkService {
    func fetchAllCharacters(completion: @escaping (Result<[RMCharacter], Error>) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(CharactersResponse.self, from: data)
                completion(.success(decoded.results))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}

