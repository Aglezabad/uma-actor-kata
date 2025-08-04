//
//  RawDataSourceError.swift
//  Umas
//
//  Created by Ángel González on 4/8/25.
//

internal enum RawDataSourceError: Error {
    case fileNotFound(filename: String)
}
