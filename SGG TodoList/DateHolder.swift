//
//  DateHolder.swift
//  SGG TodoList
//
//  Created by Chenuka Thishen on 01/01/2023.
//

import SwiftUI
import CoreData

class DateHolder: ObservableObject
{
    
    init(_ context: NSManagedObjectContext)
    {
        
    }
    
    func saveContext(_ context: NSManagedObjectContext)
    {
       do {
           try context.save()
       } catch {
           
           let nsError = error as NSError
           fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
       }
   }
}
