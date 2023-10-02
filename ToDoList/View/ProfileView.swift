//
//  ProfileView.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user: User = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .preferredColorScheme(viewModel.darkMode ? .dark : .light)
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    private func profile(user: User) -> some View {
        // Avatar
        if let image: UIImage = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(75)
                .padding()
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 150, height: 150)
                .padding()
        }
        
        // Info: Name, Email, Member since
        VStack(alignment: .leading) {
            MessageText(title: "Name: ", message: user.name)
                .padding()
            
            MessageText(title: "Email: ", message: user.email)
                .padding()
            
            MessageText(title: "Member Since: ",
                        message: "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                .padding()
            
            HStack {
                Text("Mode: ").bold()
                
                Spacer(minLength: 1)
                
                DMButton(title: "Light", isDark: viewModel.darkMode) {
                    viewModel.setMode(false)
                }
                .padding(.trailing, 30)
                
                DMButton(title: "Dark", isDark: viewModel.darkMode) {
                    viewModel.setMode(true)
                }
                
                Spacer(minLength: 1)
            }
            .padding()
        }
        .padding()
        
        // Sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
