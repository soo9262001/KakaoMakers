//
//  LoggedUser.swift
//  210731
//
//  Created by kms on 2021/08/22.
//

import Foundation

struct LoggedUser : Codable {
    var name : String
    var email : String
    
    
    enum CodingKeys : String, CodingKey {
        case name
        case email
        
    }
    
    init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try val.decode(String.self, forKey: .name)
        email = try val.decode(String.self, forKey: .email)
        
    }
}
