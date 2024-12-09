//
//  users.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 24/11/24.
//

import Foundation

struct users : Codable {
    let id : String
    let name: String
    let email: String
    let joined : TimeInterval // is just a type used to represent a duration of time, typically in seconds.
    
}
