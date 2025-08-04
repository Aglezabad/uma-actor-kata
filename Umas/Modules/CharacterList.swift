//
//  CharacterList.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

import SwiftUI

struct CharacterList: View {
    @State private var showFavouritesOnly: Bool = false
    var characters: [Character] = UmaSDK.shared.retrieveCharacters()
    var filteredCharacters: [Character] {
        characters.filter { character in
            !showFavouritesOnly || character.isFavourite
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavouritesOnly) {
                    Text("Mostrar solo favoritos")
                }
                ForEach(filteredCharacters, id: \.name) { character in
                    NavigationLink {
                        CharacterDetail(character: character)
                    } label: {
                        ListElement(listable: character)
                    }
                }
            }
            .navigationTitle("Personajes")
        } detail: {
            Text("Selecciona un personaje")
        }
    }
}

#Preview {
    CharacterList()
}
