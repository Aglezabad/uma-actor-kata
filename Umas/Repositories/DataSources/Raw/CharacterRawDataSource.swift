//
//  CharacterRawDataSource.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal actor CharacterRawDataSource: RawDataSource {
    func retrieveCharacters() async throws -> [Character] {
        try retrieveJSONData(fileName: "umamusume", type: [Character].self) ?? []
    }
}
