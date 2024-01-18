//
//  iExpense.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 17/01/2024.
//

import SwiftUI

struct iExpense: View {

    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {

        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    iExpense()
}
