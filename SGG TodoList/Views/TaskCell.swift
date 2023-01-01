//
//  TaskCell.swift
//  SGG TodoList
//
//  Created by Chenuka Thishen on 01/01/2023.
//

import SwiftUI

struct TaskCell: View
{
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedTaskItem: Taskitem
    
    var body: some View
    {
        
        CheckBoxView(passedTaskItem: passedTaskItem)
            .environmentObject(dateHolder)
        
        Text(passedTaskItem.name ?? "")
            .padding(.horizontal)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(passedTaskItem: Taskitem())
    }
}
