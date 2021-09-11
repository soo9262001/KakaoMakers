//
//  ProductModel.swift
//  210731
//
//  Created by kms on 2021/08/07.
//

import Foundation


struct Review: Codable {
    var rating: Int
    var comment: String
    
    enum CodingKeys: String, CodingKey {
        case rating
        case comment
    }
    
    init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        
        rating = try val.decode(Int.self, forKey: .rating)
        comment = try val.decode(String.self, forKey: .comment)
    }
}

struct ProductModel: Codable {
  var id: String = ""
  var category: String = ""
  var name: String = ""
  var price: Float = 0
  var imageName: String = ""
  var brand: String = ""
  var description: String = ""
  var countInStock: Int = 0
  var numReviews: Int = 0
//  var reviews: [Review]
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case category
    case name
    case price
    case imageName = "image"
    case brand
    case description
    case countInStock
    case numReviews
//    case reviews
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    category = try values.decode(String.self, forKey: .category)
    name = try values.decode(String.self, forKey: .name)
    price = try values.decode(Float.self, forKey: .price)
    imageName = try values.decode(String.self, forKey: .imageName)
    brand = try values.decode(String.self, forKey: .brand)
    description = try values.decode(String.self, forKey: .description)
    countInStock = try values.decode(Int.self, forKey: .countInStock)
    numReviews = try values.decode(Int.self, forKey: .numReviews)
//    reviews = try values.decode(Array.self, forKey: .reviews)
  }
  
}

struct ProductData: Codable {
  var products: [ProductModel]
}

