//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for list of items view
/// Primary lab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView: Bool = false
    @Published var darkMode: Bool = true
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    public func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    public func getMode() {
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data: [String : Any] = snapshot?.data(), error == nil else { return }
            DispatchQueue.main.async {
                self?.darkMode = data["darkMode"] as? Bool ?? true
            }
        }
    }
}
