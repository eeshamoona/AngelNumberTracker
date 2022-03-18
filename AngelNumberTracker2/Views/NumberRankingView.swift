//
//  ContentView.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/16/22.
//

import SwiftUI

struct NumberRankingView: View {
    @State private var isShowingSheet = false
    @EnvironmentObject var angelNumberViewModel : NumberViewModel
    
    var body: some View {
        ZStack {
            //Background
            BackgroundView()
            
            VStack {
                //Title Text
                Text("Angel Numbers")
                    .font(.system(size: 50, design: .rounded))
                    .fontWeight(.thin)
                    .foregroundColor(Color.black.opacity(0.8))
                
                //Filter Menu
                //TODO: Connect to actual data
                FilterMenuView()
                    .padding(.top, -20)
                
                Spacer()
                
                //Display all number items
                ScrollView{
                    ForEach(angelNumberViewModel.nums) { num in
                        NumberItemView(num:num)
                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y:10)
                                .padding([.leading, .trailing],35)
                                .padding(.top, 10)
                    }
                }
                
                //Opening Keypad
                Button(action: {
                        isShowingSheet.toggle()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color("myYellow").opacity(0.8))
                            .frame(width:60, height:60)
                        Text ("+")
                            .font(.largeTitle)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }.offset(y:-40)
                .sheet(isPresented: $isShowingSheet) {
                    AngelNumberEntry()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NumberRankingView()
    }
}
