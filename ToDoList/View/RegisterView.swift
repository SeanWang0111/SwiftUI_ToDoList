//
//  RegisterView.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import SwiftUI

struct RegisterView: View {
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organizing todes",
                       angle: -15,
                       background: .orange)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
