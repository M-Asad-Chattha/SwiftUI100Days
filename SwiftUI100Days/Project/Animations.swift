//
//  Animations.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 22/11/2023.
//

import SwiftUI

struct Animations: View {

    // MARK: - @State
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap me") {
           animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

#Preview {
    Animations()
}
