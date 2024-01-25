//
//  MoonshotContentView.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import SwiftUI

struct MoonshotContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.load("astronauts.json")
    let missions: [Mission] = Bundle.main.load("missions.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 100, maxHeight: 100)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

#Preview {
    MoonshotContentView()
}
