//
//  ToDooListasApp.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 24.06.2023.
//

import SwiftUI
import Firebase

@main
struct ToDooListasApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }
   
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



