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
            HeaderView(title: "Register", subTitle: "Start Building TODO.", gradients: LinearGradient(
                gradient: Gradient(colors: [.indigo,.purple,.cyan]),
                startPoint: .top,
                endPoint: .bottom
            ), angle: 15)
            .background(Color.cyan)
            
            Form{
                TextField("Full Name", text: $registerView.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $registerView.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                SecureField("password", text: $registerView.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ButtonView(title:"Register" , background: .cyan) {
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
