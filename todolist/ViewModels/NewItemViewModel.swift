//
//  NewItemViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation


import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init () {}
    
    func save () {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false;
        }
        
        return true;
    }
}
