//
//  CharacterViewModel.swift
//  Umas
//
//  Created by Ángel González on 6/8/25.
//

import Foundation

internal final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    func refreshCharacterList() {
        Task { @MainActor in
            await characters = UmaSDK.shared.retrieveCharacters()
        }
    }

    func addFavourite(_ character: Character) {
        Task {
            await UmaSDK.shared.addFavouriteCharacter(character)
            Task { @MainActor in
                await characters = UmaSDK.shared.retrieveCharacters()
            }
        }
    }

    func removeFavourite(_ character: Character) {
        Task {
            await UmaSDK.shared.removeFavouriteCharacter(character)
            Task { @MainActor in
                await characters = UmaSDK.shared.retrieveCharacters()
            }
        }
    }
}
