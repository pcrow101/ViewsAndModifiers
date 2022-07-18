//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by paucrow on 14/07/2022.
//

import SwiftUI

struct LargeBlue: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueTitle(with text: String) -> some View {
        modifier(LargeBlue(text: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            largeBlueTitle(with: "Scoreboard")
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

struct ContentView: View {
    var body: some View {
        GridStack(rows: 3, columns: 12) { row, col in
            Image(systemName: "\(row * 4 + col + 1).square")
                .padding(-8)
                .font(.system(size: 32))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/// Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font
/// suitable for prominent titles in a view.
