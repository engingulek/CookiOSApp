//
//  Cook.swift
//  CookApp
//
//  Created by engin gülek on 30.10.2022.
//

import Foundation

struct Cook:Codable {
    var imageURL:String?
    var name:String?
    var category:Category?
    var detail:[String]?
    var rating:Double?
    var minute:Int?
    var ingredients : [String]?
    var date : String?
}
