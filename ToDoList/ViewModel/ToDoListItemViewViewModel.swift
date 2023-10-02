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
    
    public func toggleIsDone(item: ToDoListItem) {
        var newItem: ToDoListItem = item
        newItem.setDone(!item.isDone)
        
        guard let userId: String = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
