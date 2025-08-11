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

    func retrieveCharacters() async -> [Character] {
        do {
            return try await characterRepository.retrieveCharacters()
        } catch {
            return []
        }
    }

    func addFavouriteCharacter(_ character: Character) async {
        do {
            try await characterRepository.addFavourite(character)
        } catch {
            print("Adding favourite failed")
        }
    }

    func removeFavouriteCharacter(_ character: Character) async {
        do {
            try await characterRepository.removeFavourite(character)
        } catch {
            print("Removing favourite failed")
        }
    }
}
