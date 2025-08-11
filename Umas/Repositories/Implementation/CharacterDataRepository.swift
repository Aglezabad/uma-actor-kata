//
//  CharacterDataRepository.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal class CharacterDataRepository: CharacterRepository {
    private let diskDataSource: CharacterDiskDataSource
    private let rawDataSource: CharacterRawDataSource

    init(diskDataSource: CharacterDiskDataSource, rawDataSource: CharacterRawDataSource) {
        self.diskDataSource = diskDataSource
        self.rawDataSource = rawDataSource
    }

    func retrieveCharacters() async throws -> [Character] {
        let favourites: Set<String> = try await diskDataSource.retrieveAllFavourites()
        var characters: [Character] = try await rawDataSource.retrieveCharacters()
        characters.indices.forEach({ characters[$0].isFavourite = favourites.contains(characters[$0].name) })
        return characters
    }

    func addFavourite(_ character: Character) async throws {
        try await diskDataSource.addFavourite(character)
    }

    func removeFavourite(_ character: Character) async throws {
        try await diskDataSource.removeFavourite(character)
    }
}
