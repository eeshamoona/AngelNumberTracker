//
//  KeyPadView.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/16/22.
//

import Foundation
import SwiftUI

struct KeyPadView: View {
    @Binding var chosenNumber : String
    var body: some View {
            ZStack {
                VStack{
                    HStack (spacing: 20) {
                        KeyPadButton(number:"1", chosenNumber: $chosenNumber )
                        KeyPadButton(number:"2", chosenNumber: $chosenNumber )
                        KeyPadButton(number:"3", chosenNumber: $chosenNumber )
                    }
                    HStack (spacing: 20) {
                        KeyPadButton(number:"4", chosenNumber: $chosenNumber )
                        KeyPadButton(number:"5", chosenNumber: $chosenNumber )
                        KeyPadButton(number:"6", chosenNumber: $chosenNumber )
                        
                    }.padding(.top,10)
                    HStack(spacing: 20){
                        KeyPadButton(number:"7", chosenNumber: $chosenNumber )
                        KeyPadButton(number:"8", chosenNumber: $chosenNumber )
                        KeyPadButton(number:"9", chosenNumber: $chosenNumber )
                        
                    }.padding(.top,10)
                    KeyPadButton(number:"0", chosenNumber: $chosenNumber ).padding(.top,10)
                }
            }.padding(.all, 20)
        }
}

struct KeyPadButton : View {
    var number : String
    @Binding var chosenNumber : String
    var body: some View {
        
        Button(action: {
            print("tapped")
            chosenNumber = chosenNumber + number
        }) {
            ZStack{
                Circle()
                    .frame(width: 90, height: 90)
                    .foregroundColor(Color.white.opacity(0.5))
                    .blur(radius: 1)
                Text(number)
                    .foregroundColor(Color.black)
                    .fontWeight(.light)
                    .font(.largeTitle)
            }
        }
    }
}
