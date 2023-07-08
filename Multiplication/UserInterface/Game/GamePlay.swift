//
//  GamePlay.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/7/23.
//

import SwiftUI

struct GamePlay: View {
    let questions: Int
    let limit: Int
    @State private var first: Int
    @State private var second: Int
    
    init(questions: Int, limit: Int) {
        self.questions = questions
        self.limit = limit
        first = Int.random(in: 1...limit)
        second = Int.random(in: 1...limit)
    }
    
    let number = ["7", "8", "9", "4", "5", "6", "1", "2", "3"]
    
    @State private var question:Int = 1
    @State private var userAnswer: String = ""
    
    @State private var correct: Bool = false
    @State private var wrong: Bool = false
    @State private var skip: Bool = false
    
    @State private var wrongAnswer:Int = 0
    
    private var answer: Int { first * second }
    
    var body: some View {
        VStack{
            Text("\(question)/\(questions)")
                .font(.system(size: 25))
                .padding(10)
            HStack{
                Text("\(first)")
                Image(systemName: "multiply")
                Text("\(second)")
            }
            .frame(width: 260, height: 80)
            .font(.system(size: 80))
            Group{
                Text("Enter Your Answer")
                    .font(.system(size: 25))
                Text("\(userAnswer)")
                    .frame(width: 260, height: 70)
                    .font(.system(size: 30))
                    .background(.quaternary)
                    .cornerRadius(10)
            }
            .frame(width: 260)
            
            CalculatorPad(userAnswer: $userAnswer)
            Group {
                Button {
                    checkAnswer()
                } label: {
                    HStack{
                        Text("Check")
                        Image(systemName: "checkmark.circle.fill")
                    }
                }
                Button{
                    skip.toggle()
                } label: {
                    HStack{
                        Text("Skip")
                        Image(systemName: "chevron.forward.2")
                        
                    }
                }
            }
            .buttonStyle(NumberPad(background: Color.orange, width: 260))
            Spacer()
        }
        .alert("Correct!!", isPresented: $correct) {
            Button("Next") { changeQuestion() }
        }
        .alert("Wrong", isPresented: $wrong) {
            Button("Try Again") { wrongAnswer += 1 }
        }
        .alert("Would You Like to Skip?", isPresented: $skip) {
            Button("Skip") {
                changeQuestion()
                wrongAnswer += 1
                skip.toggle()
                
            }
            Button("Continue") {
                skip.toggle()
            }
        }
    }
}
extension GamePlay{
    func changeQuestion (){
        first = Int.random(in: 1...limit)
        second = Int.random(in: 1...limit)
        wrongAnswer = 0
        userAnswer.removeAll()
        question += 1
    }
    func checkAnswer (){
        let user = Int(userAnswer) ?? -1
        correct = user == answer
        wrong = !correct
        userAnswer.removeAll()
    }
}

struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlay_()
    }
}

struct GamePlay_: View {
    var body: some View {
        GamePlay(questions: 5, limit: 12)
    }
}
