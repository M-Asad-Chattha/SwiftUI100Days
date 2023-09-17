//
//  ContentViewProject_2.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 03/09/2023.
//

import SwiftUI

struct ContentViewProject_2: View {
    
    // MARK: - State
    @State private var showingScore: Bool = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    var body: some View {
        ZStack {
            // LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            //RadialGradient(gradient:
                    //.init(colors: [.red, .blue]), center: .top, startRadius: 200, endRadius: 700)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ] , center: .top, startRadius:200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                
                VStack(spacing: 15) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary) // Background + Contrast
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagButtonTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(.rect(cornerRadius: 5))
                                    .shadow(radius: 5)
                            }
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Sccore: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
    }
}

#Preview {
    ContentViewProject_2()
}


// MARK: - Helper Methods
extension ContentViewProject_2 {
    private func flagButtonTapped(_ number: Int){
        scoreTitle = (number == correctAnswer) ? "Correct Answer" : "Wrong Answer"
        score += (number == correctAnswer) ? 1 : 0
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

