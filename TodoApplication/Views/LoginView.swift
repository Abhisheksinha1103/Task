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
                HeaderView(title: "Task List 📄",
                           subTitle: "A goal without a plan is just a wish.", gradients: LinearGradient(
                            gradient: Gradient(colors: [.cyan.opacity(0.3), .blue.opacity(0.8),.mint.opacity(0.3)]),
                            startPoint: .top,
                            endPoint: .bottom
                           ),angle: -15).background(Color.mint)
                
                // MARK: LoginView
                Form{
                    if !viewModel.error.isEmpty{
                        Text(viewModel.error)
                            .foregroundColor(.red)
                    }
                    VStack{
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.cyan)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
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
                            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .slide))
                            .animation(.easeIn(duration: 0.5))
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
