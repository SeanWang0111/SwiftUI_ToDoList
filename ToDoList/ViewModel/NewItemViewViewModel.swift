//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    
    init() { }
    
    func save() {
        guard canSave else { return }
        
        // Get current user id
        guard let uId: String = Auth.auth().currentUser?.uid else { return }
        
        // Create model
        let newId: String = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty && dueDate >= Date().addingTimeInterval(-86400)
    }
}
