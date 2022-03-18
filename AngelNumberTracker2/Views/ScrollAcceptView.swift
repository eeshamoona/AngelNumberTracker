//
//  ScrollAcceptView.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/17/22.
//

import Foundation
import SwiftUI

struct ScrollAcceptView : View {
    @State var maxWidth = UIScreen.main.bounds.width - 100
    @Binding var slideOffset : CGFloat
    @Binding var saving : Bool
    @Binding var chosenNumber : String
    
    @EnvironmentObject var angelNumberViewModel : NumberViewModel
    var circleWidth : CGFloat = 75
    var body : some View {
        ZStack {
            Capsule()
                .fill(Color.white.opacity(0.3))
                .frame(width: 300, height: 75)
                .overlay(
                    Capsule()
                        .stroke(Color.black.opacity(0.5), lineWidth: 4)
                        .frame(width: 300, height: 75)
                        .blur(radius: 4)
                        .offset(x:2,y:2)
                        .mask(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]), startPoint: .topLeading, endPoint:.bottomTrailing)))
                )
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(0.8), lineWidth: 8)
                        .frame(width: 300, height: 75)
                        .blur(radius: 7)
                        .offset(x:-3,y:-3)
                        .mask(Capsule().fill(LinearGradient(gradient: Gradient(colors: [ Color.clear, Color.black.opacity(0.5)]), startPoint: .topLeading, endPoint:.bottomTrailing)))
                )
            
            Text ("SWIPE TO LOCK IN")
                .foregroundColor(Color.black.opacity(0.8))
                .fontWeight(.medium)
                .padding(.leading, 30)
                
            
            HStack {
                Capsule ()
                    .fill(saving ? Color("myGreen") : Color("myYellow"))
                    .frame(width: calculateWidth()+circleWidth)
                
                Spacer(minLength: 0)
            }
            Text (saving ? "SAVING" : "")
                .foregroundColor(.white)
                .fontWeight(.medium)
            
            HStack {
                ZStack {
                    Image(systemName: "chevron.right")
                    Image(systemName: "chevron.right")
                        .offset(x:-10)
                }
                .foregroundColor(.black.opacity(0.8))
                .offset(x: 5)
                .frame(width: circleWidth, height: circleWidth)
                .background(saving ? Color("myGreen") : Color("myYellow"))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.35), radius: 5, x: 0, y: 0)
                .offset(x: slideOffset)
                .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnd(value:)))
                
                Spacer()
            }
        }.frame(width: maxWidth, height: circleWidth)
            .padding(.bottom)
    }

func calculateWidth()-> CGFloat{
    let percent = slideOffset / maxWidth
    return percent * maxWidth
}

func onChange (value: DragGesture.Value) {
    if value.translation.width > 0 && slideOffset <= maxWidth - circleWidth {
        slideOffset = value.translation.width
    }
}

func onEnd (value: DragGesture.Value) {
    
    //back Off Animation
    withAnimation(Animation.easeOut(duration: 0.3)) {
        if slideOffset > (maxWidth/2) {
            slideOffset = maxWidth - 65
            
            angelNumberViewModel.incrementTimesSeenFor(angelNum: chosenNumber)
            angelNumberViewModel.nums = (angelNumberViewModel.sortList()!)
            
            withAnimation(Animation.easeOut(duration: 1.5)){
                saving = true
            }
            
            //delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(Animation.easeOut(duration: 1.5)){
                    saving = false
                }
                withAnimation(Animation.easeOut(duration: 0.75)){
                    slideOffset = 0
                    chosenNumber = ""
                    
                }
            }
        }
        else {
            slideOffset = 0
        }
    }
}
}

