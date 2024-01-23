//
//  MoonshotContentView.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/01/2024.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct MoonshotContentView: View {

    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Asad Chattha",
                "address": {
                    "street": "123 Main Street",
                    "city": "Kot hara"
                }
            }
            """

            let date = Data(input.utf8)
            let jsonDecoder = JSONDecoder()
            if let user = try? jsonDecoder.decode(User.self, from: date) {
                print(user.address.city)
            }
        }
    }
}

#Preview {
    MoonshotContentView()
}
