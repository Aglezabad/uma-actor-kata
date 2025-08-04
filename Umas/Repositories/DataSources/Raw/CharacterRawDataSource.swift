//
//  CharacterRawDataSource.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal final class CharacterRawDataSource: RawDataSource {
    func retrieveCharacters() throws -> [Character] {
        try retrieveJSONData(fileName: "umamusume", type: [Character].self) ?? []
    }
}
