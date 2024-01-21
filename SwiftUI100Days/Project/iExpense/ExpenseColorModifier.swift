//
//  ExpenseColorModifier.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import SwiftUI

struct ExpenseColorModifier: ViewModifier {
    let amount: Double

    func body(content: Content) -> some View {
        content
            .foregroundStyle(getExpenseColor())
    }

    private func getExpenseColor() -> Color {
        if amount < 10 {
            return .green
        } else if amount <= 100 {
            return .yellow
        } else {
            return .red
        }
    }
}


// MARK: - View Extensoion

extension View {
    
    func expenseColor(for amount: Double) -> some View {
        self.modifier(ExpenseColorModifier(amount: amount))
    }
}
