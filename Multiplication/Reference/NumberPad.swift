//
//  NumberPad.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/8/23.
//

import SwiftUI


struct NumberPad: ButtonStyle {
    let background: Color
    let width: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 30))
            .frame(width: width, height: 60)
            .background(background)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    init(background: Color = Color.black, width: CGFloat = 80) {
        self.background = background
        self.width = width
    }
}

struct FunctionPad: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 30))
            .frame(width: 80,height: 70)
            .background(.gray)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
