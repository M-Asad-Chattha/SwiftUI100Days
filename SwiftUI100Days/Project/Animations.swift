//
//  Animations.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 22/11/2023.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let angle: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(angle), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(angle: -90, anchor: .topLeading),
            identity: CornerRotateModifier(angle: .zero, anchor: .topLeading)
        )
    }
}

struct Animations: View {

    // MARK: - State
    @State private var isShowingRed = false

    // MARK: - Properties

    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                     .transition(.pivot) // Defining pivot in AnyTransition extension
                // Same Behaviour but different Approach
//                    .transition(
//                        .modifier(
//                            active: CornerRotateModifier(angle: -90, anchor: .topLeading),
//                            identity: CornerRotateModifier(angle: 0, anchor: .topLeading)
//                        )
//                    )
                    
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    Animations()
}
