//
//  ExpenseSection.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    //let deleteItems: (IndexSet, String) -> Void
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            
            ForEach(expenses.filter {$0.type == title}) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //.expenseColor(for: item.amount)
                        .foregroundColor(item.amount < 10 ? .green : item.amount < 100 ? .yellow : .red)
                }
            }
            .onDelete { indexSet in
//                deleteItems(indexSet, title)
                deleteItems(indexSet)
            }
        }
    }
}

#Preview {
//    ExpenseSection(title: "Example", expenses: [], deleteItems: { _,_ in})
    ExpenseSection(title: "Example", expenses: [], deleteItems: { _ in})
}
