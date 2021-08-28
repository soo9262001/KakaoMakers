//
//  ProductAPI.swift
//  210731
//
//  Created by kms on 2021/08/07.
//

import Foundation
import Moya

enum ProductAPI {
    case totalProducts
    case detailProducts(id: String)
}

extension ProductAPI : TargetType {
    var baseURL: URL {
        guard let url = URL(string:"http://localhost:5000/api/products") else {
            fatalError("URL Error")
        }
        return url
    }
    
    var path: String {
        switch self{
        case .totalProducts :
            return "/"
        case .detailProducts(let id):
            return "/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .totalProducts, .detailProducts(_) :
            return .get
        
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .totalProducts, .detailProducts(_):
            return .requestPlain
        
        }
    }
    
    var headers: [String : String]? {
        switch self {
//        case .totalProducts(let token) :
//            return ["Authorization" : "Bearer " + token ]
        default:
            return ["Content-type" : "application/json"]
        }
       
    }
    
}
