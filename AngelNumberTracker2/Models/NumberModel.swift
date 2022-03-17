//
//  File.swift
//  AngelNumberTracker2
//
//  Created by Eesha Moona on 3/16/22.
//

import Foundation

struct Number: Identifiable {
    let id : String = UUID().uuidString
    let number : String
    let definition : String
    let timeSeen : Int
}
