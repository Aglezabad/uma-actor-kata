//
//  Listable.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal protocol Listable {
    var name: String { get }
    var image: String? { get }
    var borderColor: String? { get }
    var isFavourite: Bool { get set }
}
