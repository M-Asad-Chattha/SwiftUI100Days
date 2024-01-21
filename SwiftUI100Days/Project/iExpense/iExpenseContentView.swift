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
                Section("Personal") {

                    ForEach(expenses.items.filter {$0.type == "Personal"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseColor(for: item.amount)
                        }
                    }
                    .onDelete { indexSet in
                        removeItem(at: indexSet, section: "Personal")
                    }
                }
                
                Section("Business") {

                    ForEach(expenses.items.filter {$0.type == "Business"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .expenseColor(for: item.amount)
                        }
                    }
                    .onDelete { indexSet in
                        removeItem(at: indexSet, section: "Business")
                    }
                }
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
}


#Preview {
    iExpenseContentView()
}
