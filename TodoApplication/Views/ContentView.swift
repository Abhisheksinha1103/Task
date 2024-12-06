//
//  ContentView.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 21/11/24.
//

import SwiftUI

struct ContentView: View {
    //to create and manage the state of an object
    @StateObject var viewModel = ContentViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currUserId.isEmpty {
          accountView
        }
        else
        {
            LoginView()
        }
    }
    @ViewBuilder // used to create a multiple views in swiftUI closures
    var accountView : some View {
        TabView{
            TodoListView(userid: viewModel.currUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
