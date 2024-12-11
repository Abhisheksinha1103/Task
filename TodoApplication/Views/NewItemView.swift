//
//  NewItemView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import SwiftUI
// MARK:  CONTAINS TITLE AND DATE CALENDAR

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                . bold()
                .padding(.top,10)
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                ButtonView(title: "Save", background: Color.pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false // IT WILL CLOSE THE SHEET VIEW AND JUMP BACK TO LIST OF ITEMS
                    }
                    else
                    {
                        viewModel.isAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.isAlert, content: {
                Alert(title:Text( "Error"),
                      message: Text("please in all fields and select due date that is today or newer"))
            })
        }
    }
}



#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }) )
}
