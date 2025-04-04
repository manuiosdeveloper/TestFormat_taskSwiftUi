//
//  TestFormat_taskSwiftUiApp.swift
//  TestFormat_taskSwiftUi
//
//  Created by Aritipamula Kotaiah on 04/04/25.
//

import SwiftUI

@main
struct TestFormat_taskSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
