//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    
    init() { }
    
    func save() {
    }
    
    var canSave: Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty && dueDate >= Date().addingTimeInterval(-86400)
    }
}
