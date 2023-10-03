//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    
    let id: String
    let color: Int
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
