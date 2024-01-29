//
//  ListApp.swift
//  List
//
//  Created by Glenn Dufour on 1/27/24.
//

import SwiftUI

@main
struct ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CellData())
        }
    }
}
