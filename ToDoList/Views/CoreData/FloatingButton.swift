//
//  FloatingButton.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 24.06.2023.
//

import SwiftUI

struct FloatingButton: View
{
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View
    {
        
        VStack
        {
    
            Spacer()
            HStack
            {
                Spacer()
                NavigationLink(destination: TaskEditView(passedTaskItem: nil, initialDate: dateHolder.date)
                    .environmentObject(dateHolder))
                {
                    Text("+")
                        .font(.headline)
                    
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(100)
                .padding()
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                .padding(.vertical)
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
