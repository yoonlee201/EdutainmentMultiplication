//
//  TimeTable.swift
//  Multiplication
//
//  Created by Yoonje Lee on 7/8/23.
//

import SwiftUI

struct TimeTable: View {
    var number: Int
    var body: some View {
        VStack{
            ForEach(1..<20){ mul in
                HStack{
                    Text("\(number)")
                    Image(systemName: "multiply")
                    Text("\(mul)")
                    Text("= \(number * mul)")
                }
                .frame(width: 260, height: 28)
                .font(.system(size: 25))
            }
        }
    }
}

struct TimeTable_Previews: PreviewProvider {
    static var previews: some View {
        TimeTable(number: 4)
    }
}
