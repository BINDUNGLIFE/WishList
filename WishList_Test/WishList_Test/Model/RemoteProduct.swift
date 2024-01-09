//
//  RemoteProduct.swift
//  WishList_Test
//
//  Created by 김가빈 on 1/5/24.
//

import Foundation

struct RemoteProduct : Decodable {
    let id : Int
    let title : String
    let description : String
    let price : Double
    let thumbnail : URL
}


//struct RemoteProduct: Codable {
//    var id: Int
//    var title: String
//    var description: String
//    var price: String
//    var thumbnail: URL
//
//    var priceValue: Double? {
//        return Double(price)
//    }
//}
