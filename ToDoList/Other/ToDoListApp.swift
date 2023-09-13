//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
