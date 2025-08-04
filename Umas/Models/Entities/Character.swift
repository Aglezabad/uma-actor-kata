//
//  Character.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal struct Character: Codable, Hashable, Listable {
    private enum CodingKeys: String, CodingKey {
        case name
        case image
        case borderColor
    }

    let name: String
    let image: String?
    let borderColor: String?
    var isFavourite: Bool = false

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
