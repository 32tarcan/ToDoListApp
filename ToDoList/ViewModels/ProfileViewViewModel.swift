//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ProfileViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
        
    }
}
