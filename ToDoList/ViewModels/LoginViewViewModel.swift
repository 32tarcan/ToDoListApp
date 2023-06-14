//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
}
