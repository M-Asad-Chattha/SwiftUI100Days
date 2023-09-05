//
//  ContentViewProject_2.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 03/09/2023.
//

import SwiftUI

struct ContentViewProject_2: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("This is Button")
                .foregroundStyle(.primary)
                .padding(50)
                .background(.ultraThinMaterial )
        }
    }
}

#Preview {
    ContentViewProject_2()
}
