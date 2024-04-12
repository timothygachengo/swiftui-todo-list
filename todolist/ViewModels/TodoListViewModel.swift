//
//  TodoListViewModel.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var showingNewItemModal: Bool = false
    init () {}
}
