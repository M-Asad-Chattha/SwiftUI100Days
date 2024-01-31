//
//  AstronautView.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 31/01/2024.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

    var body: some View {
        ScrollView{
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["chaffee"]!)
        .preferredColorScheme(.dark)
}
