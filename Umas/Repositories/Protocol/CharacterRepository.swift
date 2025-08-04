//
//  CharacterRepository.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal protocol CharacterRepository: Repository {
    func retrieveCharacters() throws -> [Character]
}
