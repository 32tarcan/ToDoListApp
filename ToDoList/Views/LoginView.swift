//
//  LoginView.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Hearder
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                
                // Login Form
                Form {
                    TextField("Email Adress", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                     SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        // Attempt log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Log in")
                                .bold()
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding()
                
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                        
                }
                .padding(.bottom, 50)
                
                Spacer()
        }
       
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
