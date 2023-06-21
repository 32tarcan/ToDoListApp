//
//  LoginView.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Hearder
                HeaderView(title: "To Do List",
                           subtitle: "Take action now",
                           angle: 10,
                           background: .gray)
                
                
                
                ZStack {
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                        TextField("Email Adress", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .textInputAutocapitalization(.never)
                        
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        
                        TLButton(title: "Log in",
                                 background: .blue) {
                            viewModel.login()
                        }
                                 .padding()
                        
                    }
                    
                    
                    // Create Account
                    VStack {
                        Text("New around here?")
                        
                        NavigationLink("Create An Account",
                                       destination: RegisterView())
                        
                    }
                    .offset(y: 200)
                    
                    
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
