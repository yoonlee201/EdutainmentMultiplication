//
//  GameSet.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/7/23.
//

import SwiftUI

struct GameSet: View {
    let numOfQuestion = [5, 10, 20]
    @State private var multiplicaiton = 1
    @State private var questions = 5
    
    var body: some View {
            VStack (spacing: 20){
                Text("TEST YOUR SKILL!!!")
                    .font(.system(size:30))
                Text("\(multiplicaiton)")
                    .font(.system(size:70))
                Stepper("Multiplication to practice", value: $multiplicaiton, in: 1...19)
                    .labelsHidden()
                    .frame(width: 70)
                Text("or")
                NavigationLink("Random"){ GamePlay(questions: numOfQuestion.randomElement() ?? 5, limit: Int.random(in: 1...19)) }
                    .buttonStyle(NumberPad(width: 260))
                
                Text("Number of Questions")
                    .font(.system(size:20))
                HStack (spacing: 10) {
                    ForEach(numOfQuestion, id: \.self){ number in
                        NavigationLink("\(number)"){ GamePlay(questions: number, limit: multiplicaiton) }
                            .buttonStyle(NumberPad())
                    }
                }
            }
        
        
        
    }
}

struct GameSet_Previews: PreviewProvider {
    static var previews: some View {
        GameSet()
    }
}
