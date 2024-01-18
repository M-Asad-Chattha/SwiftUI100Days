//
//  iExpense.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 17/01/2024.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct iExpense: View {

    let user = User(firstName: "Asad", lastName: "Chattha")

    var body: some View {

        Button("Load Data") {
            let encoder = JSONEncoder()
            let data = try? encoder.encode(user)
            UserDefaults.standard.setValue(data, forKey: "user")
            
            // Read Data
            let savedData = UserDefaults.standard.data(forKey: "user")!
            let decoder = JSONDecoder()
            let savedUser = try? decoder.decode(User.self, from: savedData)
            dump(savedUser)
        }
    }
}

#Preview {
    iExpense()
}
