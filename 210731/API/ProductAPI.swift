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
    case createReview(id: String, token: String, rating: Int, comment: String)
}

extension ProductAPI : TargetType {
    var baseURL: URL {
        guard let url = URL(string: R.BaseURL.productURL) else {
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
        case .createReview(let id, _, _, _):
            return "/\(id)/reviews"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .totalProducts, .detailProducts(_) :
            return .get
        case .createReview(_,_,_,_):
            return .post
        
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .totalProducts, .detailProducts(_):
            return .requestPlain
        case .createReview(_, _, let rating, let comment):
            return .requestParameters(parameters: ["rating": rating, "comment": comment], encoding: JSONEncoding.default)
        
        }
    }
    
    var headers: [String : String]? {
        switch self {
//        case .totalProducts(let token) :
//            return ["Authorization" : "Bearer " + token ]
        case .createReview(_, let token, _, _):
            return ["Authorization" : "Bearer " + token ]
        default:
            return ["Content-type" : "application/json"]
        }
       
    }
    
}
