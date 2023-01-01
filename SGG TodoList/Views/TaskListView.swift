//
//  ContentView.swift
//  SGG TodoList
//
//  Created by Chenuka Thishen on 01/01/2023.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Taskitem.dueDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Taskitem>

    var body: some View
    {
        NavigationView
        {
            VStack
            {
                ZStack
                {
                    List
                    {
                        ForEach(items)
                        { item in
                            NavigationLink(destination: TaskEditView(passedTaskItem: item, initialDate: Date())
                                .environmentObject(dateHolder))
                            {
                               TaskCell(passedTaskItem: item)
                                    .environmentObject(dateHolder)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        
                    }
                    
                    FloatingButton()
                        .environmentObject(dateHolder)
                }
            }.navigationTitle("To Do List")
        }
    }



     
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
