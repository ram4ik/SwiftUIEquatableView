//
//  ContentView.swift
//  SwiftUIEquatableView
//
//  Created by ramil on 30.07.2020.
//

import SwiftUI

struct ContentView: View {
    @State var number: Int = 1
    
    var body: some View {
        VStack {
            Button(action: {
                number += 1
            }, label: {
                Text("Change number")
                    .font(.largeTitle)
            })
            
            Text("\(number)")
                .font(.largeTitle)
                .padding()
            
            EquatableView(content: NumberView(number: number))
        }
    }
}

struct NumberView: View {
    let number: Int
    
    var body: some View {
        print("Refresh number \(number)")
        
        return Text(number.isTriple ? "Triple" : "Not Triple")
            .font(.largeTitle)
            .onTapGesture {
                print(number)
            }
    }
}

extension NumberView: Equatable {
    static func == (lhs: NumberView, rhs: NumberView) -> Bool {
        lhs.number.isTriple == rhs.number.isTriple
    }
}

extension Int {
    var isTriple: Bool { self % 3 == 0 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
