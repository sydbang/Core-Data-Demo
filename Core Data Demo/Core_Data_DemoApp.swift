//
//  Core_Data_DemoApp.swift
//  Core Data Demo
//
//  Created by Sunghee Bang on 2022-05-10.
//

import SwiftUI

@main
struct Core_Data_DemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
