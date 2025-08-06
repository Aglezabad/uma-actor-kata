//
//  CharacterViewModel.swift
//  Umas
//
//  Created by Ángel González on 6/8/25.
//

import Foundation

internal final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = UmaSDK.shared.retrieveCharacters()

    func addFavourite(_ character: Character) {
        UmaSDK.shared.addFavouriteCharacter(character)
        characters = UmaSDK.shared.retrieveCharacters()
    }

    func removeFavourite(_ character: Character) {
        UmaSDK.shared.removeFavouriteCharacter(character)
        characters = UmaSDK.shared.retrieveCharacters()
    }
}
