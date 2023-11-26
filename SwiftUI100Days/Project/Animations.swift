//
//  Animations.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 22/11/2023.
//

import SwiftUI

struct Animations: View {

    // MARK: - @State
    @State private var enabled = false

    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .gray)
        .foregroundStyle(.white)
        .animation(nil, value: enabled) // nil will not apply any animation to all above modifiers
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled) // Coz above animation is nil, So this animation will only apply to clipshape modifier
    }
}

#Preview {
    Animations()
}
