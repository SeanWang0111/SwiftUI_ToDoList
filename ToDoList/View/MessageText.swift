//
//  MessageText.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/10/3.
//

import SwiftUI

struct MessageText: View {
    
    let title: String
    let message: String
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
            Text(message)
        }
    }
}

struct MessageText_Previews: PreviewProvider {
    static var previews: some View {
        MessageText(title: "Name: ", message: "Sean")
    }
}
