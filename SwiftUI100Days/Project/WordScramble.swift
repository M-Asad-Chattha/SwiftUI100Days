//
//  ContentViewProject_5.swift
//  Project #5
//  SwiftUI100Days
//
//  Created by o9tech on 10/11/2023.
//

import SwiftUI

struct WordScramble: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                }
                
                Section("Score") {
                    Text(String(score))
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(alertTitle, isPresented: $showingAlert, actions: {}) {
                Text(alertMessage)
            }
            .toolbar {
                ToolbarItem {
                    Button("Restart", action: startGame)
                }
            }
        }
    }
}

// MARK: - Helper Methods
extension WordScramble {
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return } // exit if the answer is empty
        
        guard !isShortWord(word: answer) else {
            showError(title: "Word is Short", message: "Word must be at least 3 characters long")
            return
        }
        
        guard isOriginal(word: answer) else {
            showError(title: "Word used already", message: "Be more original")
            return
        }
        guard  isPossible(word: answer) else {
            showError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        guard isReal(word: answer) else {
            showError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation { usedWords.insert(answer, at: 0) }
        calculateScore()
        newWord = ""
    }
    
    func startGame() {
        resetGame()
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let match = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return match.location == NSNotFound
    }
    
    func showError(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showingAlert = true
        
    }
    
    func isShortWord(word: String) -> Bool {
        return word.count < 3
    }
    
    func calculateScore() {
        let words = usedWords.compactMap { $0.count }
        let sum = words.reduce(0) { $0 + $1 }
        score = sum
    }
    
    func resetGame() {
        score = 0
        usedWords.removeAll()
    }
}

#Preview {
    WordScramble()
}
