//
//  APIManager.swift
//  210731
//
//  Created by kms on 2021/07/31.
//

import Foundation
import Moya
import SwiftyJSON
import UIKit

//protocol APIManagers {
//    associatedtype T : TargetType
//    var provider : MoyaProvider<T> { get }
//}

struct APIManager {
    static let provider =  MoyaProvider<AuthAPI>()
    
    static func authData(source : AuthAPI, view: UIViewController ,completion : @escaping(userModel) -> ()) {
        provider.request(source) { result in
            
            switch result {
            /// 로그인 성공시
            case .success(let response) :
                if response.statusCode == 200 {
                    let authListJson = try? JSONDecoder().decode(userModel.self, from: response.data)
                    print(authListJson)
                    if let authList = authListJson{
                        
                        print(authList)
                        completion(authList)
                    }
                } else {
                    let errorVC = UIAlertController(title: "Error", message: "please check email or password", preferredStyle: .alert)
                       let confirmBtn = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                       errorVC.addAction(confirmBtn)
                       view.present(errorVC, animated: true, completion: nil)
                                   
                }

            case .failure(let err) :
                print(err.localizedDescription)
                
                break
            }
        }
    }
    
    static func getProfile(token: String, completion : @escaping(LoggedUser) -> ()) {
        provider.request(.getProfile(token: token)) { result in
            
            switch result {
            /// 로그인 성공시
            case .success(let response) :
                do {
                    let jsonUser = try JSONDecoder().decode(LoggedUser.self, from: response.data)
                    print(jsonUser)
                    completion(jsonUser)
                }catch let err{
                    print(err.localizedDescription)
                    return
                }

            case .failure(let err) :
                print(err.localizedDescription)
                
                break
            }
        }
    }
}
