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

    func retrieveCharacters() throws -> [Character] {
        var characters: [Character] = try rawDataSource.retrieveCharacters()
        let favourites: Set<String> = try diskDataSource.retrieveAllFavourites()
        characters.indices.forEach({ characters[$0].isFavourite = favourites.contains(characters[$0].name) })
        return characters
    }

    func addFavourite(_ character: Character) throws {
        try diskDataSource.addFavourite(character)
    }

    func removeFavourite(_ character: Character) throws {
        try diskDataSource.removeFavourite(character)
    }
}
