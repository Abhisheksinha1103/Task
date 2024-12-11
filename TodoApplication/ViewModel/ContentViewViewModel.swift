//
//  ContentViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//
import FirebaseAuth
import Foundation

/*This ViewModel listens for changes in the Firebase authentication state
 and updates the current user's ID (currUserId)
 whenever the user logs in or out.
 */
// MARK: ONCE USER SIGNOUT THIS FUNCTION WILL CHANGE THE STATE

class ContentViewViewModel : ObservableObject {
    @Published var currUserId : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            
            DispatchQueue.main.async {
                if let userId = user?.uid, !userId.isEmpty {
                    self?.currUserId = userId
                } else {
                    // If user ID is nil or empty
                    self?.currUserId = FirestoreConstantsViewModel.defaultUser // default value
                }
            }
        })
    }
    public var isSignedIn :  Bool{
        return Auth.auth().currentUser != nil
    }
    
}
