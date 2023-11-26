//
//  Animations.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 22/11/2023.
//

import SwiftUI

struct Animations: View {
    
    // MARK: - State
    @State private var isShowingRed = false
    
    // MARK: - Properties

    // MARK: - Body
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation { isShowingRed.toggle() }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 10))
                    // .transition(.scale) // Scaling from smallest to largest (declraed size)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity)) // Use one transition when the view is being shown and another when it’s disappearing.
            }
        }
    }
}

#Preview {
    Animations()
}
