//
//  ProductAPIManager.swift
//  210731
//
//  Created by kms on 2021/08/07.
//

import Foundation
import Moya


//protocol ProductManagers {
//    associatedtype T : TargetType
//    var provide : MoyaProvider<T> { get }
//}

class ProductNetworkManager {
    
    static let provider = MoyaProvider<ProductAPI>()
      static func getProductsData(
        completion: @escaping([ProductModel]) -> ()) {
        
        provider.request(.totalProducts) { (result) in
          switch result {
          case .success(let res):
            do {
              let productData = try JSONDecoder().decode(ProductData.self, from: res.data)
              print("==========",productData.products)
              completion(productData.products)
              
            } catch let err {
              
              print(err.localizedDescription)
              return
            }
          case .failure(let err):
            
            print(err.localizedDescription)
            return
          }
        }
      }
    
    static func getDetailProductsData(
        id: String,
        completion: @escaping(ProductModel) -> ()
      ) {
        provider.request(.detailProducts(id: id)) { result in
          switch result {
          case .success(let res):
            do {
              let productData = try JSONDecoder().decode(ProductModel.self, from: res.data)
              completion(productData)
            } catch let err {
              print(err.localizedDescription)
              return
            }
          case .failure(let err):
            print(err.localizedDescription)
            return
          }
        }
      }

}
