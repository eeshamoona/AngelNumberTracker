//
//  FilterMenu.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/17/22.
//

import Foundation
import SwiftUI

struct FilterMenuView : View {
    var h : CGFloat = 45
    var w : CGFloat = (UIScreen.main.bounds.size.width)
    
    @State var allTimeSelected : Bool = true
    @State var monthlySelected : Bool = false
    @State var quarterlySelected : Bool = false
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color("myYellow").opacity(0.2))
                .frame(width: w-50, height: h)
            HStack{
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 0.2)){
                        allTimeSelected = true
                        monthlySelected = false
                        quarterlySelected = false
                    }
                    
                }) {
                    ZStack {
                        Capsule()
                            .fill(allTimeSelected ? Color("myYellow").opacity(0.4) : Color.clear)
                        Text("All Time")
                            .font(.headline)
                            .fontWeight(allTimeSelected ? .bold: .light)
                    }
                    .offset(x:33)
                        .frame(width: w/3, height: h, alignment: .leading)
                        
                }
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 0.2)){
                        allTimeSelected = false
                        monthlySelected = true
                        quarterlySelected = false
                    }
                }) {
                    ZStack {
                        Capsule()
                            .fill(monthlySelected ? Color("myYellow").opacity(0.4) : Color.clear)
                        Text("Monthly")
                            .font(.headline)
                            .fontWeight(monthlySelected ? .bold : .light)
                    }
                        .frame(width: w/3, height: h, alignment: .leading)
                        
                }
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 0.2)){
                        allTimeSelected = false
                        monthlySelected = false
                        quarterlySelected = true
                    }
                }) {
                    ZStack {
                        Capsule()
                            .fill(quarterlySelected ? Color("myYellow").opacity(0.4): Color.clear)
                        Text("Quarterly")
                            .font(.headline)
                            .fontWeight(quarterlySelected ? .bold : .light)
                    }
                    .offset(x:-33)
                        .frame(width: w/3, height: h, alignment: .leading)
                        
                }
            }.foregroundColor(Color.black.opacity(0.8))
        }
    }
}

