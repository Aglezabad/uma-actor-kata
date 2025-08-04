//
//  RawDataSource.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

import Foundation

internal protocol RawDataSource: DataSource {}

extension RawDataSource {
    func retrieveJSONData<T: Decodable>(fileName: String, type: T.Type) throws -> T? {
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw RawDataSourceError.fileNotFound(filename: fileName)
        }
        let data: Data = try Data(contentsOf: file)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
