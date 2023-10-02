//
//  RegisterView.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    @State private var isKeyboardVisible = false
    @State private var isShowPhotoLibrary = false
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start organizing todes",
                       angle: -15,
                       background: .orange)
            
            InputField
                .padding(.top, -100)
            
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
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: Binding<UIImage>(
                get: { self.viewModel.cover ?? UIImage() },
                set: { self.viewModel.cover = $0 }
            ), sourceType: .photoLibrary)
        }
    }
    
    @ViewBuilder
    private var InputField: some View {
        Form {
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }
            
            HStack {
                Spacer()
                Button(action: {
                    isShowPhotoLibrary = true
                }, label: {
                    if let image: UIImage = viewModel.cover {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(25)
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                    }
                })
                Spacer()
            }
            
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            TextField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TLButton(title: "Create Account", background: .green) {
                viewModel.createAccount()
            }
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
