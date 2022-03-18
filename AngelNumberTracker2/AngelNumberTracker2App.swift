//
//  AngelNumberTracker2App.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/16/22.
//

// This is going the be the main app
// It will contain a NumberRankingView
// The NumberRankingView will showModal(KeypadEntryView)

import SwiftUI

@main
struct AngelNumberTracker2App: App {
    @StateObject var angelNumberViewModel : NumberViewModel = NumberViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                NumberRankingView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            .environmentObject(angelNumberViewModel)
        }
    }
}
