//
//  HeaderView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.pink)
                    .rotationEffect(Angle(degrees: 15))
                    .offset(y: -80)
                
                VStack {
                    Text("Todo List")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    
                    Text("Get Things Done")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 30)
            }
            .frame(width: UIScreen.main.bounds.width * 3 , height: 300)
            .offset(y: -100)
        }
}

#Preview {
    HeaderView()
}
