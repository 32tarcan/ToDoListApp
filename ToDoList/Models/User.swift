//
//  User.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
