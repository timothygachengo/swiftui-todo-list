//
//  ProfileView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                   profile(user: user)
                } else {
                    Text("Loading User....")
                }
                
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.getUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            . foregroundColor(.blue)
            .frame(width: 125, height: 125)
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                    .padding()
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                    .bold()
                    .padding()
                Text(user.email)
            }
            HStack {
                Text("Created At: ")
                    .bold()
                    .padding()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        
        // sign out button
        Button("Sign Out") {
            viewModel.signOut()
        }.foregroundColor(.red)
    }
    
}

#Preview {
    ProfileView()
}
