//
//  TodoListView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    @StateObject var todoViewModel = TodoListItemViewModel()
    @StateObject var viewModel: TodoListViewModel;
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String;
    
    init (userId: String) {
        self.userId = userId;
        let firestorPath = "users/\(userId)/todos"
        self._items = FirestoreQuery(collectionPath: firestorPath)
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List (items) {item in
                    TodoListItemView(item: item)
                        .swipeActions (edge: HorizontalEdge.trailing) {
                            Button {
                                // delete action
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                        .swipeActions(edge: HorizontalEdge.leading) {
                            Button {
                                // mark as done
                                todoViewModel.markAsDone(item: item)
                            } label : {
                                Text("Mark as Done")
                            }
                            .tint(.green)
                        }
                        
                }
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
    TodoListView(userId: "iZHO5TswDKa4vg6YYuypAyh3VoN2")
}
