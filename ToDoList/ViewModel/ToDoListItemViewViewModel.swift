//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    
    init() { }
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid: String = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
