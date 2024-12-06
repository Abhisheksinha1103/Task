//
//  ProfileView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 22/11/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let currUsers = viewModel.user{
                    profile(currUsers: currUsers)
                }
                else{
                    Text("Loading data..")
                    ProgressView()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear(){
            viewModel.fetchUser()
        }
        
    }
    @ViewBuilder
    func profile (currUsers : users) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.teal)
            .frame(width:230, height:230)
            .padding()
        // It contains name, email , member since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(currUsers.name)
            }
            .padding()
            HStack{
                Text("Email: ")
                    .bold()
                Text(currUsers.email)
            }
            .padding()
            HStack{
                Text("Member: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: currUsers.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
            
        }
        Button("Log out"){
            viewModel.Logout()
        }
        .foregroundColor(.red)
        .frame(width: 100)
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
