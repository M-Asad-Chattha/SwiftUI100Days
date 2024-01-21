//
//  iExpense.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 17/01/2024.
//

import SwiftUI

struct iExpenseContentView: View {
    @State var expenses = Expenses()
    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Personal", expenses: expenses.items.filter {$0.type == "Personal"}, deleteItems: removePersonalItems)
                ExpenseSection(title: "Business", expenses: expenses.items.filter {$0.type == "Business"}, deleteItems: removeBusinessItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                 }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}

// MARK: - Action Methods

extension iExpenseContentView {

    func removeItem(at offsets: IndexSet, section: String) {
        let sectionIndices = expenses.items.filter{$0.type == section}.indices
        let globalIndicesToDelete = offsets.map {sectionIndices[$0]}
        expenses.items.remove(atOffsets: IndexSet(globalIndicesToDelete))
    }

    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()

        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }

        expenses.items.remove(atOffsets: objectsToDelete)
    }

    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.items.filter { $0.type == "Personal" })
    }

    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.items.filter { $0.type == "Business" })
    }
}


#Preview {
    iExpenseContentView()
}
