//
//  ExpenseItem.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 20/01/2024.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
