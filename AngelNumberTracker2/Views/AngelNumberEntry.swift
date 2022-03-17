//
//  AngelNumberEntry.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/17/22.
//

import Foundation
import SwiftUI

struct AngelNumberEntry : View {    
    @State var slideOffset : CGFloat = 0
    @State var saving : Bool = false
    @State var chosenNumber : String = ""
    
    var circleWidth : CGFloat = 75
    
    var body: some View {
        ZStack {
            Background2View().ignoresSafeArea()
            ZStack{
                VStack{
                    ZStack {
                        Color.white.opacity(0.4)
                            .cornerRadius(30)
                        Text(chosenNumber)
                            .foregroundColor(Color.black.opacity(0.6))
                            .fontWeight(.thin)
                            .font(.system(size: 60, design: .rounded))
                    } .frame(width: UIScreen.main.bounds.width - 100, height: 100)
                        .padding(.top, 60)
                    
                    KeyPadView(chosenNumber: $chosenNumber)
                    
                    ScrollAcceptView(slideOffset: $slideOffset, saving: $saving, chosenNumber: $chosenNumber)
                }
            }
        }
    }
}

struct AngelNumberEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AngelNumberEntry()
    }
}
