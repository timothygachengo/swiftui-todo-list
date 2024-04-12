//
//  ContentView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            TodoListView()
        } else {
            NavigationView{
                LoginView()
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}



