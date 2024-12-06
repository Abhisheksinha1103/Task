//
//  Extensions.swift
//  TodoApplication
//
//  Created by Abhishek Kumar Sinha on 24/11/24.
//

import Foundation

// extensions are used to add extra functionality
extension Encodable {
    
    func asDictionary() -> [String:Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do{
            let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
             
        }
        catch{
            return [:]
        }
        
    }
    
}
