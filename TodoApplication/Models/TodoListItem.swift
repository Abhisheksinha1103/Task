//
//  TodoListItem.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 26/11/24.
//

import Foundation

// MARK: IT CONTAINS THE ITEMS OF TASK LIST

struct TodoListItem : Codable, Identifiable {
    
    let id : String
    let title : String
    let DueDate : TimeInterval
    let CreatedDate : TimeInterval // when the user is created the list
    var isDone : Bool  // for check and uncheck

    mutating func setDone(_ state : Bool) // this fun is used for check and uncheck if a item is done (update model) in db
    {
        isDone = state
    }
    
}
