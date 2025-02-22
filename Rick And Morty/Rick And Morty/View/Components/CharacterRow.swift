//
//  CharacterRow.swift
//  Rick And Morty
//
//  Created by Ivan Myrza on 22.02.2025.
//

import SwiftUI

struct CharacterRow: View {
    let character: RMCharacter
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    Color.gray
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                case .failure:
                    Color.red
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(character.name)
                    .font(.headline)
                
                Text(character.speciesAndGender)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(character.location.name)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Button(action: {
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "play.fill")
                        Text("Watch episodes")
                    }
                    .font(.footnote)
                    .foregroundColor(.orange)
                }
            }
            
            Spacer()
            
            Text(character.status.uppercased())
                .font(.caption.bold())
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(character.statusColor)
                .cornerRadius(8)
        }
        .padding(.vertical, 8)
    }
}

