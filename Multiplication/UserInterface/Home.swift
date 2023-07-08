//
//  Home.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/7/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                NavigationLink("Game"){ GameSet() }
                NavigationLink("Times Table"){ TimeTableSet() }
//                Button("Calculator"){
//                    // TODO:
//                }
            }
            .buttonStyle(NumberPad(background: Color.orange, width: 260))
            .navigationTitle("Calcultor")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
