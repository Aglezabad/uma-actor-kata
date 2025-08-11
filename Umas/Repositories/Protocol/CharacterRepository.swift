//
//  CharacterRepository.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal protocol CharacterRepository: Repository, Sendable {
    func retrieveCharacters() async throws -> [Character]
    func addFavourite(_ character: Character) async throws
    func removeFavourite(_ character: Character) async throws
}
