//
//  TodoApplicationApp.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 21/11/24.
//

import SwiftUI
import FirebaseCore
@main
struct TodoApplicationApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
