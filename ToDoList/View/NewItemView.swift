//
//  NewItemView.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    @State private var isKeyboardVisible = false
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 40))
                .bold()
                .padding(.top, 50)
            
            Form {
                LazyVGrid(columns: Array(repeating: GridItem(), count: ArrayManager.colorArr.count), spacing: 16) {
                    ForEach(ArrayManager.colorArr.indices, id: \.self) { index in
                        ColorCell(color: ArrayManager.colorArr[index], index: index, selectedColorIndex: viewModel.colorSelect) {
                            viewModel.colorSelect = index
                        }
                    }
                }
                
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save",background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill all fields and select due date that is today or newer."))
            }
            
            if isKeyboardVisible {
                HideKeyboardButton()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            isKeyboardVisible = true
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            isKeyboardVisible = false
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
