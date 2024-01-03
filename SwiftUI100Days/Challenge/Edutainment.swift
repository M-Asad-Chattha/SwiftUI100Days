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
    @State private var question = "Enter your answer"
    @State private var questionNumber = -1
    @State private var title = "Start Game"
    @State private var answer = ""
    @State private var correctAnswer = 0
    @State private var score = 0

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
                TextField(question, text: $answer)
                Text("Score: \(score)")
                Button("Check Answer", action: onTapCheckAnswer)
                    .buttonStyle(.borderedProminent)
                    .disabled(answer == "")

                Spacer()
                Spacer()
                Button((questionNumber == -1) ? "Start Game" : "Restart", action: onTapStartGame)
                    .disabled(questionNumber == -1 ? false : /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
  
    func onTapStartGame() {
        createQuestion()
        questionNumber = 1
    }
    
    func onTapCheckAnswer() {
        checkAnswer()
    }
    
    func createQuestion() {
        let randomNumber = Int.random(in: 1...segments[selectedNumberForQuestionsToAsk])
        correctAnswer = numberOfTable * randomNumber
        question = "\(numberOfTable) x \(randomNumber) = ?"
        questionNumber += 1
    }
    
    func checkAnswer() {
        if correctAnswer == Int(answer) { score += 1 }
        answer = ""
        print("questionNumber: \(questionNumber) == segments[selectedNumberForQuestionsToAsk]: \(segments[selectedNumberForQuestionsToAsk])")
        if questionNumber == segments[selectedNumberForQuestionsToAsk] {
            questionNumber = -1
            question = "Enter your answer"
        } else {
            createQuestion()
        }
    }
}

#Preview {
    Edutainment()
}
