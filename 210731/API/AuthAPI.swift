//
//  AuthAPI.swift
//  210731
//
//  Created by kms on 2021/07/31.
//

import Foundation
import Moya

enum AuthAPI {
    case register(name: String, email: String, password: String)
    case login(email: String, password: String)
    case getProfile(token: String)
    case updateUser(name: String, email: String, password: String, token: String)
    
}

extension AuthAPI : TargetType {
    var baseURL: URL {
        guard let url = URL(string: R.BaseURL.authURL) else { fatalError("URL Error") }
        return url
    }
    
    var path: String {
        switch self {
        case .register(_, _, _):
            return "/"
        case .login(_, _):
            return "/login"
        case .getProfile(_), .updateUser(_, _, _, _):
            return "/profile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .register(_, _, _), .login(_, _):
            return .post
        case .getProfile(_):
            return .get
        case .updateUser(_, _, _, _):
            return .put
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let email,let password) :
            return .requestParameters(parameters: ["email" : email, "password" : password], encoding: JSONEncoding.default)
        case .register(let name, let email, let password), .updateUser(let name, let email, let password, _) :
            return .requestParameters(parameters: ["name" : name, "email" : email, "password" : password], encoding: JSONEncoding.default)
        case .getProfile(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getProfile(let token), .updateUser(_, _, _, let token):
            return ["Authorization" : "Bearer " + token]
        case .login(_,_), .register(_, _, _) :
            return ["Content-type" : "application/json"]
        }
        
    }
    
    
}
