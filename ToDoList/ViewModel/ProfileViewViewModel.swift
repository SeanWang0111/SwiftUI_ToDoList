//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by 王奕翔 on 2023/9/13.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import Foundation

class ProfileViewViewModel: ObservableObject {
    
    @Published var user: User? = nil
    @Published var image: UIImage? = nil
    @Published var darkMode: Bool = true
    
    init() { }
    
    private func downloadImage(imageStr: String) {
        // Get a reference to storage
        let storageRef = Storage.storage().reference()
        
        // Specify the data
        let fileRef = storageRef.child(imageStr)
        
        // Retrieve the data
        fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            // Check for errors & UIImage
            guard error == nil, let data: Data = data, let image = UIImage(data: data) else { return }
            self.image = image
        }
    }
    
    public func fetchUser() {
        guard let userId: String = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data: [String : Any] = snapshot?.data(), error == nil else { return }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  avatar: data["avatar"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  darkMode: data["darkMode"] as? Bool ?? true,
                                  joined: data["joined"] as? TimeInterval ?? 0)
                
                self?.downloadImage(imageStr: data["avatar"] as? String ?? "")
                self?.darkMode = data["darkMode"] as? Bool ?? true
            }
        }
    }
    
    public func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
    
    public func setMode(_ isDark: Bool) {
        guard let userId: String = Auth.auth().currentUser?.uid, var newUser: User = user else { return }
        newUser.setDarkMode(isDark)
        darkMode = isDark
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())
    }
}
