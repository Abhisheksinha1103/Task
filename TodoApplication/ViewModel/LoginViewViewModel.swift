//
//  LoginViewViewModel.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init() {}
    // MARK: LOGIN AUTH
    func Login(){
        guard validate() else{
            return
        }
        // login
        Auth.auth().signIn(withEmail: email, password: password) // reference to firebase
    }
    // MARK: VALIDATION
    private func validate() -> Bool{
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            error = "Please fill all fields *"
            return  false
        }
        
        guard email.contains("@") && email.contains(".") else
        {
            error = "Please Enter valid Email"
            return false
        }
        return true
    }
}
