//
//  The_Best_MapApp.swift
//  The Best Map
//
//  Created by User on 09.04.2022.
//

import SwiftUI

@main
struct The_Best_MapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView().environmentObject(vm)
        }
    }
}
