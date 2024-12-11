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
    @Published var dueDate = Date()
    @Published var isAlert = false
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
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        // save models  to fb
        let db = Firestore.firestore()
        db.collection(FirestoreConstantsViewModel.usersCollection)
            .document(uId)
            .collection(FirestoreConstantsViewModel.todosCollection)
            . document(newid)
            .setData(newItem.asDictionary()) // formatting newItem in the form of dictionary
    }
    //MARK: VALIDATION
    var canSave : Bool {
        guard  !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86000) else {
            return false
        }
        return true
    }
}
