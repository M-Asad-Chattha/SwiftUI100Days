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
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter a word", text: $newWord)
                        .autocapitalization(.none)
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
            .onSubmit { addNewWord() }
        }
    }
}

// MARK: - Helper Methods
extension WordScramble {
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // exit if the answer is empty
        guard answer.count > 0 else { return }
        
        withAnimation { usedWords.insert(answer, at: 0) }
        newWord = ""
    }
}

#Preview {
    WordScramble()
}
