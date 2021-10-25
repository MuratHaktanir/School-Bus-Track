//
//  School_Bus_TrackApp.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 25.10.2021.
//

import SwiftUI

@main
struct School_Bus_TrackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
