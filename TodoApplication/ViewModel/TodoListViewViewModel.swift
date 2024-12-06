//
//  TodoListViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel :ObservableObject{
    @Published var ShowItem = false
     private let userid : String
     init(userid: String){
        self.userid = userid
    }
    
    func delete(id : String)
    {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userid)
            .collection("todos")
            .document(id)
            .delete()
    }
}
 
