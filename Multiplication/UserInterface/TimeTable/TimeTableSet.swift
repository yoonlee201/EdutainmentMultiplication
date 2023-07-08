//
//  TimeTableSet.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/8/23.
//

import SwiftUI

struct TimeTableSet: View {
    var body: some View {
        ScrollView{
            ForEach(1..<20) { mult in
                NavigationLink("\(mult)"){ TimeTable(number: mult) }
            }
        }
        .buttonStyle(NumberPad(width: 260))
    }
}

struct TimeTableSet_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableSet()
    }
}
