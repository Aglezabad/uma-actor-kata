//
//  CharacterRepository.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal protocol CharacterRepository: Repository {
    func retrieveCharacters() throws -> [Character]
    func addFavourite(_ character: Character) throws
    func removeFavourite(_ character: Character) throws
}
