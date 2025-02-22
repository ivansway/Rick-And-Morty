//
//  CharactersResponse.swift
//  Rick And Morty
//
//  Created by Ivan Myrza on 22.02.2025.
//

import Foundation
import SwiftUI

struct CharactersResponse: Decodable {
    let info: Info
    let results: [RMCharacter]
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct RMCharacter: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Decodable {
    let name: String
    let url: String
}


extension RMCharacter {
    /// Цвет фона для статуса персонажа
    var statusColor: Color {
        switch status.lowercased() {
        case "alive":
            return .green
        case "dead":
            return .red
        default:
            return .gray
        }
    }
    
    /// Полное описание вида: "Human, male"
    var speciesAndGender: String {
        "\(species), \(gender.lowercased())"
    }
}

