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
           // animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay {
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount)
        }
        .onAppear{
            animationAmount = 2
        }
    }
}

#Preview {
    Animations()
}
