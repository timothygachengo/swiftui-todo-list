//
//  RegsiterViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    
    init () {}
    
    func register () {
        guard validate () else {
            return;
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            guard let userId = result?.user.uid else {
                return;
            }
            
            self.saveUser(uid: userId)
            
        }
        
    }
    
    private func saveUser(uid: String)  {
        let newUser = User(id: uid,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore();
        
        db.collection("users")
            .document(uid)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate () -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false;
        }
        
        return true;
    }
}
