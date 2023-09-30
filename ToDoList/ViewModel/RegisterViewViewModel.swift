//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage
import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var cover: UIImage? = nil
    @Published var avatar: String  = ""
    @Published var email: String  = ""
    @Published var password: String  = ""
    
    init() { }
    
    public func uploadPhoto() {
        // Make sure that the selected image property isn't nil
        guard let image: UIImage = cover else { return }
        
        // Create storage reference
        let storageRef = Storage.storage().reference()
        
        // Turn our image into data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        // Specify the file path and name
        let path: String = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        // Upload that data
        let uploadTask = fileRef.putData(imageData, metadata: nil) { metadata, error in
            guard error == nil && metadata != nil else { return }
            self.avatar = path
            self.register()
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, 
                           avatar: avatar,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func register() {
        guard validate() else { return }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId: String = result?.user.uid else { return }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
