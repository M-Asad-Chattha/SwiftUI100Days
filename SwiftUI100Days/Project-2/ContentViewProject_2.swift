//
//  ContentViewProject_2.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 03/09/2023.
//

import SwiftUI

struct ContentViewProject_2: View {
    var body: some View {
//        LinearGradient(colors: [.red, .green, .blue], startPoint: .top, endPoint: .bottom)
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        
        // Linear Gradient with stops
//        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
//        ]), startPoint: .top, endPoint: .bottom)
        // OR
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)
        ]), startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    ContentViewProject_2()
}
