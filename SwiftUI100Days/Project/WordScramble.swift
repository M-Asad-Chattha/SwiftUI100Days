//
//  ContentViewProject_5.swift
//  Project #5
//  SwiftUI100Days
//
//  Created by o9tech on 10/11/2023.
//

import SwiftUI

struct WordScramble: View {
    let people = ["person1", "person2", "person3", "person4", "person5", "person6", "person7", "person8", "person9", "person10"]

    var body: some View {
        NavigationView {
            List {
                Button("Check Spelling") {
                    spellCheck(word: "Swifto")
                }
                
                Section("Dynamic Data") {
                    ForEach(people, id: \.self) {
                        Text("Row \($0)")
                    }
                }
            }
            .navigationTitle("Word Scramble")
        }
    }
}

// MARK: - Helper Methods
extension WordScramble {
    func randomPerson() -> String {
        people.randomElement() ?? "person1"
    }
    
    func spellCheck(word: String) {
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        print(misspelledRange)
        print(misspelledRange.location == NSNotFound)
    }
}

#Preview {
    WordScramble()
}
