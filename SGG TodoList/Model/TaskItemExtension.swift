//
//  TaskItemExtension.swift
//  SGG TodoList
//
//  Created by Chenuka Thishen on 01/01/2023.
//

import SwiftUI

extension Taskitem
{
    func isCompleted() -> Bool
    {
        return completedDate != nil
    }
}
