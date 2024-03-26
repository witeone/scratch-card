//
//  ScratchyApp.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import SwiftUI
import SwiftData

@main
struct ScratchyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CardModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        .modelContainer(sharedModelContainer)
    }
}
