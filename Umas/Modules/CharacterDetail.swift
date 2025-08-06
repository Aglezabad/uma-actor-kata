//
//  CharacterDetail.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

import SwiftUI

struct CharacterDetail: View {
    @StateObject var characterViewModel: CharacterViewModel
    let name: String

    var body: some View {
        if let character: Character = characterViewModel.characters
            .first(where: { $0.name == name }) {
            let borderColor = Color(hexadecimal: character.borderColor ?? "")
            ScrollView {
                if let image: UIImage = .init(named: character.image ?? "") {
                    VStack {
                        CircleImage(image: image, borderColor: borderColor ?? .gray)
                            .frame(maxWidth: 250)
                    }
                    .frame(maxWidth: .infinity)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text(character.name).font(.title)
                        FavouriteButton(isSet: character.isFavourite) { enabled in
                            if enabled {
                                characterViewModel.addFavourite(character)
                            } else {
                                characterViewModel.removeFavourite(character)
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Text("El personaje con nombre \(name) no existe")
        }
    }
}

#Preview {
    CharacterDetail(characterViewModel: .init(), name: "Agnes Tachyon")
}
