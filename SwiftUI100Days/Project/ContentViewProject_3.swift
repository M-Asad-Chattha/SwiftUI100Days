//
//  ContentViewProject_3.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 17/09/2023.
//
//  DAY 23 - About Deep Diving inside Views And Modifiers
//
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.red)
            .clipShape(.capsule)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .bold()
                .foregroundStyle(.white)
                .padding()
                .background(.black)
        }
    }
}

extension View {
    func waterMarked(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

// MARK: - Custom Container
struct GridStack <Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}


struct ContentViewProject_3: View {
    var body: some View {
//        Text("AA")
//        Text("Hello, World!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
        
        
//        VStack {
//            // Apply custom modifier
//            Text("Submerge")
//                .modifier(Title())
//
//            // Apply custom modifier using View extension
//            Text("Marine")
//                .titleStyle()
//        }
        
        // Apply Custome Modifier extened by View and text
//        Color.red
//            .frame(width: 300, height: 200)
//            .waterMarked(with: "Asad Chatthe")
        
        // Custom Container
        GridStack(rows: 3, columns: 4) { row, col in
            Text("R\(row) C\(col)")
        }
    }
}

#Preview {
    ContentViewProject_3()
}
