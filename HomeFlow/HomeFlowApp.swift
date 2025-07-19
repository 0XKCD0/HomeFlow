//
//  HomeFlowApp.swift
//  HomeFlow
//
//  Created by Shivangi Dutta on 13/07/25.
//

import SwiftUI
import Firebase

@main
struct HomeFlowApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
