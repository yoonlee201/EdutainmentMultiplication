//
//  CalculatorPad.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/8/23.
//

import SwiftUI

struct CalculatorPad: View {
    let number = ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0"]
    @Binding var userAnswer: String
    
    let numberColor: Color = Color.gray
    var body: some View {
        VStack{
            GridStack(rows: 3, cols: 3) { row, col in
                Button("\(number[row * 3 + col])"){
                    userAnswer += "\(number[row * 3 + col])"
                }
            }
            HStack{
                Button("0") {
                    userAnswer += "0"
                }
                .buttonStyle(NumberPad(width: 170))
                Button {
                    if !userAnswer.isEmpty{userAnswer.removeLast()}
                } label: {
                    Image(systemName: "delete.backward.fill")
                }
                .buttonStyle(NumberPad(background: .orange))
            }
            
        }
        .buttonStyle(NumberPad())
        .padding(10)
        
    }
}

struct CalculatorPad_Previews: PreviewProvider {
    
    static var previews: some View {
        CalculatorPad_Test()
    }
}
struct CalculatorPad_Test: View{
    @State var str = ""
    var body: some View {
        CalculatorPad(userAnswer: $str)
    }
}
