//
//  UpdateUser.swift
//  210731
//
//  Created by kms on 2021/09/04.
//

import Foundation

struct UpdateUser : Codable {
    var name : String
    var email : String
    var password: String
    
    
    enum CodingKeys : String, CodingKey {
        case name
        case email
        case password
    }
    
    init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try val.decode(String.self, forKey: .name)
        email = try val.decode(String.self, forKey: .email)
        password = try val.decode(String.self, forKey: .password)
        
    }
}
