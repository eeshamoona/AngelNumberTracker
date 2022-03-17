//
//  NumberItem.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/17/22.
//

import Foundation
import SwiftUI

struct NumberItemView : View {
    var num : Number
    var body : some View {
        ZStack{
            Color.white.opacity(0.50)
                .frame(width:(UIScreen.main.bounds.size.width)-50,height:150)
                .blur(radius: 1)
            HStack(alignment: .center) {
                VStack(alignment: .leading){
                    Text(num.number)
                        .font(.system(size:60, design:.rounded))
                        .fontWeight(.light)
                    Text("Definition: " + String(num.definition))
                        .font(.subheadline)
                        .italic()
                }.padding(.leading, 20)
                Spacer()
                ZStack(alignment: .trailing) {
                    VStack(alignment: .center) {
                        Text("Seen")
                            .font(.headline)
                        Text(String(num.timeSeen))
                            .font(.largeTitle)
                        Text("Times")
                            .font(.headline)
                    }
                }.padding(.leading,60)
                    .padding(.trailing, 20)
            }
            .foregroundColor(Color.black.opacity(0.8))
        }
    }
}
struct NumberItemView_Previews: PreviewProvider {
    static var previews: some View {
        NumberItemView(num: Number(number: "1111", definition: "This is a longer sentence", timeSeen: 12))
    }
}
