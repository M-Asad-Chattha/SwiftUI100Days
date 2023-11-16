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
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
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
        }
    }
}

// MARK: - Helper Methods
extension WordScramble {
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return } // exit if the answer is empty
        
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
        newWord = ""
    }
    
    func startGame() {
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
}

#Preview {
    WordScramble()
}
