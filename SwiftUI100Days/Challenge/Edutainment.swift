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

    var body: some View {
        Stepper("Table Number: \(numberOfTable)", value: $numberOfTable, in: 2...12)
        
        
    }
}

// MARK: - Enums
extension Edutainment {
  
}

#Preview {
    Edutainment()
}
