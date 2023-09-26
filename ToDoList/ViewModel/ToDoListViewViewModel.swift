//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import Foundation

/// ViewModel for single to do list item view (each row in items list)
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView: Bool = false
    
    init() { }
    
    func delete(id: String) {
        
    }
}
