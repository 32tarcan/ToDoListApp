//
//  ProfileView.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile ")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
