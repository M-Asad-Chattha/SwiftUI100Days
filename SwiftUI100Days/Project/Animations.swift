//
//  Animations.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 22/11/2023.
//

import SwiftUI

struct Animations: View {
    
    // MARK: - State
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    // MARK: - Properties
    let letters = Array("Hello, SwiftUI!")

    // MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { number in
                Text(String(letters[number]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .orange)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(number) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded {_ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    Animations()
}
