//
//  CharacterDataRepository.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal class CharacterDataRepository: CharacterRepository {
    let rawDataSource: CharacterRawDataSource

    init(rawDataSource: CharacterRawDataSource) {
        self.rawDataSource = rawDataSource
    }

    func retrieveCharacters() throws -> [Character] {
        try rawDataSource.retrieveCharacters()
    }
}
