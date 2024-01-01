//
//  Edutainment.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 08/12/2023.
//

import SwiftUI



struct Edutainment: View {
    
    // MARK: - Properties
    @State private var numberOfTable = 2
    @State private var selectedNumberForQuestionsToAsk = 0

    let segments = [5, 10, 20]

    var body: some View {
        NavigationView {
            VStack {
                Stepper("Table Number: \(numberOfTable)", value: $numberOfTable, in: 2...12)
                    .padding()
                Picker("Number of Questions", selection: $selectedNumberForQuestionsToAsk) {
                    ForEach(segments.indices, id: \.self) { index in
                        Text("\(segments[index])")
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                Button("Start Game", action: startGame)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Edutainment")
        }
    }
}

// MARK: - Enums
extension Edutainment {
  
}

// MARK: - Helper Methods
extension Edutainment {
  
    func startGame() {
        
    }
}

#Preview {
    Edutainment()
}
