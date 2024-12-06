//
//  LoginView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var  viewModel = LoginViewViewModel()
   
    var body: some View {
        NavigationView{
            VStack
            {
                // MARK: HeaderView
            
                HeaderView(Title: "Task List 📄",
                           SubTitle: "A goal without a plan is just a wish.", backgroundColor: Color.cyan, angle: -15).background(Color.orange)
                
                // MARK: LoginView
             
                Form{
                    if !viewModel.error.isEmpty{
                        Text(viewModel.error)
                            .foregroundColor(.red)
                    }
                    VStack{
                        TextField("Email", text: $viewModel.Email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.cyan)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.Password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.cyan)
                    }
                    .padding(.top,9)
                    ButtonView(title: "Log in", background: Color.blue, action: {
                        viewModel.Login()
                    })
                    .padding()
                }
                
                // MARK: CREATING NEW ACCOUNT
    
                VStack{
                    Text("New User ?")
                    NavigationLink("Create Account") {
                        RegisterView()
                    }
                }
                .padding(.bottom,30)
                Spacer()
            }
        }
    }
 
}

#Preview {
    LoginView()
}
