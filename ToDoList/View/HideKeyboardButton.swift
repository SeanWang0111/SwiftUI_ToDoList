//
//  HideKeyboardButton.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/30.
//

import SwiftUI

struct HideKeyboardButton: View {
    
    var body: some View {
        Button(action: {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }) {
            Text("Done")
                .tint(.red)
                .bold()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .trailing)
        .transition(.move(edge: .bottom))
    }
}

struct HideKeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        HideKeyboardButton()
    }
}
