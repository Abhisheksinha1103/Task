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

    func isToggleDone(item: TodoListItem){
        var newItem = item // the reason to create copy of item here because if we try to do this on item bcz item is immuttable
        newItem.setDone(!item.isDone)
        
        guard let uid =  Auth.auth().currentUser?.uid else{ // CURRENT LOGIN USER ID
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
                  .document(uid)
                  .collection("todos")
                  .document(newItem.id) // here there no newitem is created just updating the data for the existing item
                  .setData(newItem.asDictionary())
    }

}
