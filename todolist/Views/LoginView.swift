//
//  LoginView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI


struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel();
    
    var body: some View {
        NavigationView {
    
            VStack{
                HeaderView(title: "Todo List", subtitle: "Get things done", angle: -10, background: Color.pink);
                // Login form
                
               
                
                Form {
                    if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email", text: $loginViewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .textContentType(.emailAddress)
                    
                    SecureField("Password", text: $loginViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.password)
                    
                    TLButton(title: "Login", background: .blue) {
                        // action
                        loginViewModel.login()
                    }
                        
                }
                // Create an accout
                VStack{
                    Text("Don't have an account");
                    NavigationLink("Create an account",
                    destination: RegisterView())
                }
                    
                    Spacer()
                }
            }
        }
        
        
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
