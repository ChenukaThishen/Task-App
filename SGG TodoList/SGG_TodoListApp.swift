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
            
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}
