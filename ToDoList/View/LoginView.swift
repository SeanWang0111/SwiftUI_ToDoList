//
//  LoginView.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
        .overlay(
            HideKeyboardButton()
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing), alignment: .bottom
        )
    }
    
    struct HideKeyboardButton: View {
        var body: some View {
            Button(action: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Text("Hide Keyboard")
            }
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
