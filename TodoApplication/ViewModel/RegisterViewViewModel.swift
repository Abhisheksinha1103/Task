//
//  RegisterViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//
import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewViewModel : ObservableObject{  // published is used when if anything change in class it will update and publish it to the view
    @Published  var Name: String = ""
    @Published  var email: String = ""
    @Published  var password: String = ""
    
    func Register(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] Results, Error in // weak self is used here so that no memory leak will happen
            guard let userid = Results?.user.uid else{  // once the user is created it will generate id for that USER
                return
            }
            self?.insertUserRecord(id: userid)
            
        }
    }
        // MARK: INSERT RECORD IN FB
       // Date().timeIntervalSince1970 when you save the exact moment an event happens like when a user logs in.
        private func insertUserRecord(id: String)
        {
            let newUser =  users(id:  id, name: Name, email: email, joined: Date().timeIntervalSince1970)
            let db = Firestore.firestore() /// database Creation in the form of collection  and documents
            db.collection("users")
                .document(id)
                .setData(newUser.asDictionary()) 
        }
        
    // MARK: VALIDATION
    
    private func validate() -> Bool {
        guard !Name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return  false
        }
        guard email.contains("@") && email.contains(".") else
        {return false}
        
        guard password.count >= 6 else {
            return false
        }
       return true
    }
}
