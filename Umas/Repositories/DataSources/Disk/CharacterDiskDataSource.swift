//
//  CharacterDiskDataSource.swift
//  Umas
//
//  Created by Ángel González on 5/8/25.
//

internal actor CharacterDiskDataSource: DiskDataSource {
    private let userDefaultsId: String = "uma_favourites"

    func addFavourite(_ character: Character) async throws {
        var favourites: Set<String> = try load(id: userDefaultsId, type: Set<String>.self) ?? []
        favourites.insert(character.name)
        try save(id: userDefaultsId, value: favourites)
    }

    func removeFavourite(_ character: Character) async throws {
        var favourites: Set<String> = try load(id: userDefaultsId, type: Set<String>.self) ?? []
        favourites.remove(character.name)
        try save(id: userDefaultsId, value: favourites)
    }

    func retrieveAllFavourites() async throws -> Set<String> {
        try load(id: userDefaultsId, type: Set<String>.self) ?? []
    }
}
