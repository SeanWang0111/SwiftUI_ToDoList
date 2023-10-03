//
//  User.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import Foundation

struct User: Codable {
    
    let id: String
    let avatar: String
    let name: String
    let email: String
    var darkMode: Bool
    let joined: TimeInterval
    
    mutating func setDarkMode(_ state: Bool) {
        darkMode = state
    }
}
