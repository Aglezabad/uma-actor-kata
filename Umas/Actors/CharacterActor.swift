//
//  CharacterActor.swift
//  Umas
//
//  Created by Ángel González on 11/8/25.
//

internal actor CharacterActor {
    private var characters: [Character] = []

    func updateCharactersFromSDK() async {
        characters = await UmaSDK.shared.retrieveCharacters()
    }

    func getCharacters() -> [Character] {
        characters
    }
}
