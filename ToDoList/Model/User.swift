//
//  User.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
