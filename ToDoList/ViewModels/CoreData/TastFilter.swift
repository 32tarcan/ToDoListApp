//
//  TastFilter.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 24.06.2023.
//


import SwiftUI

enum TaskFilter: String
{
    static var allFilters: [TaskFilter]
    {
        return [.NonCompleted,.Completed,.OverDue,.All]
    }
    
    case All = "All"
    case NonCompleted = "To Do"
    case Completed = "Completed"
    case OverDue = "Overdue"
}
