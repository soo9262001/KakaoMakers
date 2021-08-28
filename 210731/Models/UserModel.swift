//
//  Model.swift
//  210731
//
//  Created by kms on 2021/07/31.
//

import Foundation

struct userModel : Codable {
    var name : String
    var email : String
    var token : String
    
    enum CodingKeys : String, CodingKey {
        case name
        case email
        case token
    }
    
    init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try val.decode(String.self, forKey: .name)
        email = try val.decode(String.self, forKey: .email)
        token = try val.decode(String.self, forKey: .token)
    }
}

