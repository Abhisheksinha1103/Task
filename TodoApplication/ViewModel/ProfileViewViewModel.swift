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
    
    // Refactored fetchUser() to use async/await
    func fetchUser() async { // This is now an async function
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        do {
            let db = Firestore.firestore()
            // Use the async API of Firestore to fetch the document
            let documentSnapshot = try await db.collection("users")
                .document(userId)
                .getDocument()
            
            guard let data = documentSnapshot.data() else {
                return
            }
            // Update the user on the main thread
            DispatchQueue.main.async {
                self.user = users(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        } catch {
            // Handle error if something goes wrong
            print("Error fetching user data: \(error.localizedDescription)")
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
