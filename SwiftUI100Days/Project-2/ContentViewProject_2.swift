//
//  ContentViewProject_2.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 03/09/2023.
//

import SwiftUI

struct ContentViewProject_2: View {
    @State private var showingAlert = false
    
    var body: some View {
//        LinearGradient(colors: [.red, .green, .blue], startPoint: .top, endPoint: .bottom)
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        
        // Linear Gradient with stops
//        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
//        ]), startPoint: .top, endPoint: .bottom)
        // OR
//        LinearGradient(gradient: Gradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55)
//        ]), startPoint: .top, endPoint: .bottom)
        
        // Radial Gradient
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        // Angular Gradient
//        AngularGradient.init(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
        Button("Show Alert") {
           showingAlert = true
        }
        .alert("Important Message ", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this")
        }
    }
}

#Preview {
    ContentViewProject_2()
}
