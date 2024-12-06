//
//  ProfileViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel:ObservableObject{
    init(){}
    @Published var user : users? = nil
    func fetchUser() { // it will fetch the current user
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId).getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else { // here snapshot will return the document data in dictionary format..
                    return
                }
                DispatchQueue.main.async{
                    self?.user = users(id: data["id"] as? String ?? "", // cast in string
                                       name: data["name"] as? String ?? "",
                                       email: data["email"] as? String ?? "",
                                       joined: data["joined"] as? TimeInterval ?? 0)
                }
                
            }
    }
                func Logout() {
                    do{
                        try Auth.auth().signOut() // log out from application

                    }catch{
                        print(error)
                    }
                }

}
