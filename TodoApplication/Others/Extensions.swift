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
            print("Encoding failed.")
            return [:]
        }
        do{
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any]{
                return json
            }
            else{
                throw NSError(domain: "EncodingError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Failed to cast JSON data to dictionary."])
            }
            
        }catch{
            print("Error during JSONSerialization: \(error.localizedDescription)")
            return [:]
            
        }
    }
}
