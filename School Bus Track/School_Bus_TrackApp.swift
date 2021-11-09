//
//  School_Bus_TrackApp.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 25.10.2021.
//

import SwiftUI

@main
struct School_Bus_TrackApp: App {
    @StateObject var loginModel = LoginModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginModel)
        }
    }
}
