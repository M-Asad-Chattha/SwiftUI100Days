//
//  MoonshotContentView.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import SwiftUI

var layout = [
    GridItem(.adaptive(minimum: 80, maximum: 120))
]

struct MoonshotContentView: View {

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    MoonshotContentView()
}
