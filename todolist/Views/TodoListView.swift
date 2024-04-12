//
//  TodoListView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel = TodoListViewModel();
    
    private let userId: String;
    
    init (userId: String) {
        self.userId = userId;
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button {
                    viewModel.showingNewItemModal = true
                } label:  {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented:  $viewModel.showingNewItemModal) {
                //content
                NewItemView(newItemPresented: $viewModel.showingNewItemModal)
            }
        }
    }
}

#Preview {
    TodoListView(userId: "")
}
