//
//  BackgroundView.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/17/22.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1), Color.white.opacity(0.5), Color.white.opacity(1.0)]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color("myPink").opacity(0.2), Color("myBlue").opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            ZStack {
                Circle()
                    .frame(width: 400, height: 400)
                    .offset(x:150, y:-200)
                    .foregroundColor(Color("myIndigo").opacity(0.5))
                    .blur(radius: 6)
                Circle()
                    .frame(width: 300, height:300)
                    .offset(x:-100, y:-70)
                    .foregroundColor(Color("myGreen").opacity(0.3))
                    .blur(radius: 6)
                RoundedRectangle(cornerRadius: 30)
                    .frame(width:300,height:100)
                    .offset(x:50, y:250)
                    .foregroundColor(Color("myYellow").opacity(0.2))
                    .rotationEffect(Angle(degrees: -30))
                    .blur(radius: 6)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
