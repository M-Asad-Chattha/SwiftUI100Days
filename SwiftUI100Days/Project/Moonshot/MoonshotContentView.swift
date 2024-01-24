//
//  MoonshotContentView.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import SwiftUI

struct MoonshotContentView: View {
    let astronauts = Bundle.main.load("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    MoonshotContentView()
}
