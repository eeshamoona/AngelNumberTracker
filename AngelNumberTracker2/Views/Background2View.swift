//
//  Background2View.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/17/22.
//

import Foundation
import SwiftUI

struct Background2View: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1), Color.white.opacity(0.5), Color.white.opacity(1.0)]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color("myBlue").opacity(0.4), Color("myPink").opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            ZStack {
                Circle()
                    .frame(width: 400, height: 400)
                    .offset(x:-200, y:260)
                    .foregroundColor(Color("myIndigo").opacity(0.5))
                    .blur(radius: 10)
                Circle()
                    .frame(width: 300, height:300)
                    .offset(x:150, y:-170)
                    .foregroundColor(Color("myGreen").opacity(0.3))
                    .blur(radius: 10)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Background2View_Previews: PreviewProvider {
    static var previews: some View {
        Background2View()
    }
}
