//
//  UmaSDK.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal final class UmaSDK {
    static let shared = UmaSDK()

    private let characterRepository: CharacterRepository

    private init() {
        characterRepository = CharacterDataRepository(diskDataSource: .init(), rawDataSource: .init())
    }

    func retrieveCharacters() -> [Character] {
        do {
            return try characterRepository.retrieveCharacters()
        } catch {
            return []
        }
    }

    func addFavouriteCharacter(_ character: Character) {
        do {
            try characterRepository.addFavourite(character)
        } catch {
            print("Adding favourite failed")
        }
    }

    func removeFavouriteCharacter(_ character: Character) {
        do {
            try characterRepository.removeFavourite(character)
        } catch {
            print("Removing favourite failed")
        }
    }
}
