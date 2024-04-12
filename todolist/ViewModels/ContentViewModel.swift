//
//  ContentViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation
import FirebaseAuth

class ContentViewModel : ObservableObject {
    @Published var currentUserId: String = "";
    private var handler: AuthStateDidChangeListenerHandle?
    
    init () {
        let handler = Auth.auth().addStateDidChangeListener {[weak self] _, user  in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil;
    }
}
