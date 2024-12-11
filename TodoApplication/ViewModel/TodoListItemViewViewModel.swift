//
//  TodoListItemViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TodoListItemViewViewModel : ObservableObject {
    init() {}
    
    func checkmarkImageName(for item: TodoListItem) -> String {
        return item.isDone ? "checkmark.circle.fill" : "circle"
    }
    
    func formattedDueDate(for item: TodoListItem) -> String {
        let date = Date(timeIntervalSince1970: item.dueDate)
        return date.formatted(date: .abbreviated, time: .shortened)
    }
    
    func isToggleDone(item: TodoListItem){
        var newItem = item // the reason to create copy of item here because if we try to do this on item bcz item is immuttable
        newItem.setDone(!item.isDone)
        
        guard let uid =  Auth.auth().currentUser?.uid else{ // CURRENT LOGIN USER ID
            return
        }
        
        let db = Firestore.firestore()
        db.collection(FirestoreConstantsViewModel.usersCollection)
            .document(uid)
            .collection(FirestoreConstantsViewModel.todosCollection)
            .document(newItem.id) // here there no newitem is created just updating the data for the existing item
            .setData(newItem.asDictionary())
    }
    
}
