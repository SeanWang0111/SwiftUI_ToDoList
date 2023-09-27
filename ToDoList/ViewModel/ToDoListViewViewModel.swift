//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item view (each row in items list)
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView: Bool = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
