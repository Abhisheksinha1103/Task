//
//  LoginViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject{
    @Published var Email = ""
    @Published var Password = ""
    @Published var error = ""
    
    init() {}
    
    // MARK: LOGIN AUTH

    func Login(){
        guard validate() else{
            return
        }
        // login
        Auth.auth().signIn(withEmail: Email, password: Password) // reference to firebase
    }
    
    // MARK: VALIDATION
    
   private func validate() -> Bool{
        error = ""
        guard !Email.trimmingCharacters(in: .whitespaces).isEmpty,
              !Password.trimmingCharacters(in: .whitespaces).isEmpty else{
            error = "Please fill all fields *"
            return  false
        }
        
        guard Email.contains("@") && Email.contains(".") else
        {
            error = "Please Enter valid Email"
            return false
        }
       return true
    }
}
