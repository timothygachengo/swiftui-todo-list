//
//  TLButton.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String;
    let background: Color;
    let action: () -> Void;
    
    var body: some View {
        Button {
            action()
        } label : {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "Btn", background: .blue) {
        // Action
    }
    
}
