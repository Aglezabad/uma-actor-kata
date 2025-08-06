//
//  DiskDataSource.swift
//  Umas
//
//  Created by Ángel González on 5/8/25.
//

import Foundation

internal protocol DiskDataSource: DataSource {}

extension DiskDataSource {
    func load<T: Decodable>(id: String, type: T.Type) throws -> T? {
        guard let value: Data = UserDefaults.standard.data(forKey: id) else { return nil }
        let decodedValue: T = try JSONDecoder().decode(type, from: value)
        return decodedValue
    }

    func save<T: Encodable>(id: String, value: T) throws {
        let encodedValue: Data = try JSONEncoder().encode(value)
        return UserDefaults.standard.set(encodedValue, forKey: id)
    }
}
