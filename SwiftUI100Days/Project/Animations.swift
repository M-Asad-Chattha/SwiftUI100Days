//
//  Animations.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 22/11/2023.
//

import SwiftUI

struct Animations: View {

    var body: some View {
        Flag()
    }
}

/// Draggable Flag with Animation Effect
struct Flag: View {

    // MARK: - @State
    @State private var dragAmount: CGSize  = .zero

    var body: some View {
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.2),
            .init(color: .green, location: 0.2)
        ]), startPoint: .leading, endPoint: .trailing)
        .frame(width: 300, height: 200)
        .clipShape(.rect(cornerRadius: 10))

        .overlay(
            Image(.icMoonStar)
                .resizable()
                .scaledToFit()
                .scaleEffect(0.7)
        )
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged{ dragAmount = $0.translation }
                .onEnded { _ in
                    // Reset the drag amount
                    withAnimation(.bouncy()) { dragAmount = CGSize.zero }
                }
        )
    }
}

#Preview {
    Animations()
}
