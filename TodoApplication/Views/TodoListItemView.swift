//
//  TodoListItemView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import SwiftUI

// MARK: TASKLIST {TITLE AND DUE DATE}

struct TodoListItemView: View {
    let item : TodoListItem
    @StateObject var viewModel = TodoListItemViewViewModel()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.DueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button(action: {
                viewModel.isToggleDone(item: item) //function call
            }
        , label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.cyan)
            })
        }
      
    }
}

#Preview {
    TodoListItemView(item: .init(id: "123", title: "Get Milk", DueDate: Date().timeIntervalSince1970, CreatedDate: Date().timeIntervalSince1970, isDone: true))
    
}
