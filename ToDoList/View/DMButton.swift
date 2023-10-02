//
//  DMButton.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/10/3.
//

import SwiftUI

struct DMButton: View {
    
    let title: String
    let isDark: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: (isDark && title == "Dark" || !isDark && title == "Light") ? "checkmark.circle.fill" : "circle")
                .tint(isDark ? .white : .black)
                .padding(.trailing, 5)
            
            Text(title)
                .foregroundStyle(isDark ? .white : .black)
                .padding(.trailing, 5)
        }
        .background(.gray)
        .cornerRadius(10)
    }
}

struct DMButton_Previews: PreviewProvider {
    static var previews: some View {
        DMButton(title: "Light", isDark: false) {
        }
    }
}
