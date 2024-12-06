//
//  NewItemViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var DueDate = Date()
    @Published var IsAlert = false
    init(){}
    func save() {
        guard canSave else{
            return
        }
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //create model
        let newid = UUID().uuidString
        let newItem = TodoListItem(
            id: newid,
            title: title,
            DueDate: DueDate.timeIntervalSince1970,
            CreatedDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // save models  to fb
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            . document(newid)
            .setData(newItem.asDictionary())

    }
    //MARK: VALIDATION
    var canSave : Bool {
        guard  !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard DueDate >= Date().addingTimeInterval(-86000) else {
            return false
        }
        return true
    }
}
