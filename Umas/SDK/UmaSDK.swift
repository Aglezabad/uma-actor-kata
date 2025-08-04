//
//  UmaSDK.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal final class UmaSDK {
    static let shared = UmaSDK()

    let characterRepository: CharacterRepository

    private init() {
        characterRepository = CharacterDataRepository(rawDataSource: .init())
    }

    func retrieveCharacters() -> [Character] {
        do {
            return try characterRepository.retrieveCharacters()
        } catch {
            return []
        }
    }
}
