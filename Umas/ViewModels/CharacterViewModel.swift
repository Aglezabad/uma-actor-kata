//
//  CharacterViewModel.swift
//  Umas
//
//  Created by Ángel González on 6/8/25.
//

import Foundation

internal final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    private let characterActor: CharacterActor = .init()

    func refreshCharacterList() {
        Task {
            await characterActor.updateCharactersFromSDK()
            let characters: [Character] = await characterActor.getCharacters()
            await MainActor.run {
                self.characters = characters
            }
        }
    }

    func addFavourite(_ character: Character) {
        Task {
            await UmaSDK.shared.addFavouriteCharacter(character)
            refreshCharacterList()
        }
    }

    func removeFavourite(_ character: Character) {
        Task {
            await UmaSDK.shared.removeFavouriteCharacter(character)
            refreshCharacterList()
        }
    }
}
