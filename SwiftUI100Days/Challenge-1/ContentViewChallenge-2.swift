//
//  ContentViewChallenge-2.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 20/09/2023.
//

import SwiftUI

struct ContentViewChallenge_2: View {
    let gameOptions = ["Rock", "Paper", "Scissors"]
    @State private var randomOption = Int.random(in: 0...2)
    @State private var isCorrectAnswer = false
    @State private var score = 0
    @State private var questionCount = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text("What's next of \(gameOptions[randomOption])")
            ForEach(gameOptions, id: \.self) { item in
                Button(action: {
                   selectedOptions(selection: item)
                }) {
                    Text(item)
                }
            }
            
            Spacer()
            
            if questionCount == 10 {
                Text("You Score is: \(score)")
            }
        }
    }
    
    private func selectedOptions(selection: String) {
        let question = gameOptions[randomOption]
        
        switch (question, selection)  {
        case ("Rock", "Paper"):
            isCorrectAnswer = true
        case ("Paper", "Scissors"):
            isCorrectAnswer = true
        case ("Scissors", "Rock"):
            isCorrectAnswer = true
        default:
            isCorrectAnswer = false
        }
        
        randomOption = Int.random(in: 0...2)
        score += isCorrectAnswer ? 1 : 0
        questionCount == 10 ? (questionCount = 0) : (questionCount += 1)
    }
}

#Preview {
    ContentViewChallenge_2()
}
