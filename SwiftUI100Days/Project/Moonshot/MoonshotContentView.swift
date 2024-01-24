//
//  MoonshotContentView.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import SwiftUI

struct MoonshotContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.load("astronauts.json")
    let mission: [Mission] = Bundle.main.load("missions.json")
    
    var body: some View {
        Text(String(mission.count))
    }
}

#Preview {
    MoonshotContentView()
}
