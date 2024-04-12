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
            accountView()
           
        } else {
            NavigationView{
                LoginView()
            }
        }
        
        
    }
    
    @ViewBuilder
    func accountView() -> some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Home", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}



