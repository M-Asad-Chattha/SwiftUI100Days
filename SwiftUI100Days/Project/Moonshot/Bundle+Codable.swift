//
//  Bundle+Codable.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 24/01/2024.
//

import Foundation

extension Bundle {

    func load<T: Codable>(_ file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in Bundle.")
        }

        guard let data = try? (Data(contentsOf: url)) else {
            fatalError("Failed to load \(file) from Bundle.")
        }

        let decoder = JSONDecoder()
        guard let load = try? decoder.decode(T.self, from: data) else {
            fatalError("Faild to decode \(file) from Bundle.")
        }

        return load
    }
}
