//
//  ProfileViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation
import FirebaseAuth


class ProfileViewModel: ObservableObject {
    init () {}
    
    func signOut () {
        guard let uid = Auth.auth().currentUser?.uid else {
            do {
                try Auth.auth().signOut()
            } catch {
                return
            }
            
            return
        }
        
        do {
            try Auth.auth().signOut();
        } catch {
            return;
        }
        
        
    }
}
