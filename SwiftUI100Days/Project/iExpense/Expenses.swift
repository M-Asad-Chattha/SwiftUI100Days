//
//  Expenses.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import Foundation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            let encoded = try? JSONEncoder().encode(items)
            UserDefaults.standard.setValue(encoded, forKey: "Items")
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
