//
//  GridStack.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/8/23.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let cols: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<cols, id: \.self) { col in
                        VStack{
                            content(row, col)
                            
                        }
                    }
                }
            }
        }
    }
}
