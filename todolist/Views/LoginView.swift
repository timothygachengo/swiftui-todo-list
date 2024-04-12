//
//  LoginView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI


struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
    
            VStack{
                HeaderView();
                // Login form
                
                Form {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.password)
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            Text("Login")
                                .bold()
                                .foregroundColor(.white)
                        }
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
