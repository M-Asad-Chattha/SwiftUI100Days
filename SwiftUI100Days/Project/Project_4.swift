//
//  Project_4.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 21/09/2023.
//

import SwiftUI

struct Project_4: View {
    var body: some View {
        VStack {
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .omitted))
        }
    }
    
    func trivialExample(){
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date.now
        
        var components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ??  0
        let minute = components.minute ?? 0
    }
}

#Preview {
    Project_4()
}
