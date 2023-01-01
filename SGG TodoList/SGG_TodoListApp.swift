//
//  SGG_TodoListApp.swift
//  SGG TodoList
//
//  Created by Chenuka Thishen on 01/01/2023.
//

import SwiftUI

@main
struct SGG_TodoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
