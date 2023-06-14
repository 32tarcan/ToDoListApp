//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
