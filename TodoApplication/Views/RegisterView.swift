//
//  RegisterView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var registerView = RegisterViewViewModel()
    var body: some View {
        
        VStack{
            HeaderView(Title: "Register", SubTitle: "Start Building TODO.", backgroundColor: Color.orange, angle: 15)
            
            Form{
                TextField("Full Name", text: $registerView.Name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $registerView.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("password", text: $registerView.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                ButtonView(title:"Register" , background: .orange) {
                    registerView.Register()
                }
            }
            
            
            Spacer()
            }
        .offset(y:-40)
       
    }
}

#Preview {
    RegisterView()
}
