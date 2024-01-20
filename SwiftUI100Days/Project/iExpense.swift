//
//  iExpense.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 17/01/2024.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct iExpense: View {

    @State private var expenses = Expenses()

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 0)
                    expenses.items.append(expense)
                 }
            }
        }
    }
}

// MARK: - Action Methods

extension iExpense {
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
        
    }
}


#Preview {
    iExpense()
}
