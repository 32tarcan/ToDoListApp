//
//  MainView.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 25.06.2023.
//


import SwiftUI


struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    let persistenceController = PersistenceController.shared
    

    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            
            accountView
            
        }else {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
        
    }
@ViewBuilder
var accountView: some View {
    TabView {
        ToDoListView(userId: viewModel.currentUserId)
            .tabItem {
                Label("Home", systemImage: "house")
            }
        ProfileView()
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        
    }
}
}


struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
