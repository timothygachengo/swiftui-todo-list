//
//  LoginViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation
import ValidatorCore
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () {}
    
    func login () {
        guard validate() else {
            return;
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate () -> Bool {
        errorMessage = "";

        let validatior = Validator()
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields"
            return false;
        }
        
        return true;
    }
}
