//
//  NewItemView.swift
//  todolist
//
//  Created by Timothy Mugo on 12/04/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.automatic)
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)

                
                TLButton (title: "Save", background: .pink) {
                    if (viewModel.canSave) {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }.padding()
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message:
                Text("Please fill in all the fields and select due date that is today or newer"))
                
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}
