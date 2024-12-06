//
//  TodoListView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import SwiftUI
import FirebaseFirestore

// MARK: DELETE FUNCTIONALITY
         // @FirestoreQuery it is used to fetch the data from fb and update it in View
struct TodoListView: View {
        @StateObject var viewModel : TodoListViewViewModel
        @FirestoreQuery var items : [TodoListItem]
    
   init(userid : String){ // this is use for whom we get items
       self._items = FirestoreQuery(collectionPath:"users/\(userid)/todos")
       // instead of creating the view model created a state object which associated user id
       self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userid: userid))
   }
        var body: some View {
       
        NavigationView{
            VStack{
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button("delete"){
                                viewModel.delete(id: item.id)
                             }
                            .tint(.red) // BG COLOR FOR DELETE SWIPE
                        }
                }
  
            }
            .navigationTitle("Task List")
            .toolbar{
                Button(action: {
                    viewModel.ShowItem  = true
                }
                , label: {
                    Image(systemName: "plus")
                })
            }   .sheet(isPresented: $viewModel.ShowItem) {
                NewItemView(newItemPresented: $viewModel.ShowItem) // it will call the new item view
                
            }
        }
            
        
    }
}



#Preview {
    TodoListView(userid: "ocgvMAnqHtSJzpGO2WBWgU9sHOz2")
}
