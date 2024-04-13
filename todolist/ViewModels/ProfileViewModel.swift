//
//  ProfileViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewModel: ObservableObject {
    init () {}
    
    @Published var user: User? = nil
    
    func signOut () {
        guard (Auth.auth().currentUser?.uid) != nil else {
            return
        }
        
        do {
            try Auth.auth().signOut();
        } catch {
            return;
        }
        
        
    }
    
    func getUser () {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .getDocument {
                [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0)
                }
                
            }
        
        
    }
}
