//
//  TodoListViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation
import FirebaseFirestore

class TodoListViewModel: ObservableObject {
    @Published var showingNewItemModal: Bool = false
    
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    /// Delete todo list item
    /// - Parameter id: String
    func delete(id: String) {
        let db = Firestore.firestore()
        print(id)
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
        
    }
    
    func markAsDone (id: String) {
        
    }
}
