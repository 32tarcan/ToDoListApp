//
//  TastListView.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 24.06.2023.
//

import SwiftUI
import CoreData


struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder

    @State var selectedFilter = TaskFilter.NonCompleted
    @State var isRegisterViewPresented = false

    var body: some View {
        NavigationView {
            VStack {
                DateScroller()
                    .padding()
                    .environmentObject(dateHolder)
                ZStack {
                    List {
                        ForEach(filteredTaskItems()) { taskItem in
                            NavigationLink(
                                destination: TaskEditView(passedTaskItem: taskItem, initialDate: taskItem.dueDate!)
                                    .environmentObject(dateHolder)
                            ) {
                                TaskCell(passedTaskItem: taskItem)
                                    .environmentObject(dateHolder)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Picker("", selection: $selectedFilter.animation()) {
                                ForEach(TaskFilter.allFilters, id: \.self) { filter in
                                    Text(filter.rawValue)
                                }
                            }
                        }
                    }

                    FloatingButton()
                        .environmentObject(dateHolder)

                    VStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                isRegisterViewPresented = true
                            }) {
                                NavigationLink(destination: RegisterView()) {
                                    Text("Register")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 20) // Yatay boşluğu ayarlayın
                                        .padding(.vertical, -50) // Dikey boşluğu ayarlayın
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            NavigationLink(destination: LoginView()) {
                                Text("Log In")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, -70) // Yatay boşluğu ayarlayın
                                    .padding(.vertical, -50) // Dikey boşluğu ayarlayın
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                }
            }
            .navigationTitle("To Doo Listas")
        }
    }
    
    private func filteredTaskItems() -> [TaskItem]
    {
        if selectedFilter == TaskFilter.Completed
        {
            return dateHolder.taskItems.filter{ $0.isCompleted()}
        }
        
        if selectedFilter == TaskFilter.NonCompleted
        {
            return dateHolder.taskItems.filter{ !$0.isCompleted()}
        }
        
        if selectedFilter == TaskFilter.OverDue
        {
            return dateHolder.taskItems.filter{ $0.isOverdue()}
        }
        
        return dateHolder.taskItems
    }
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { filteredTaskItems()[$0] }.forEach(viewContext.delete)
            
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
