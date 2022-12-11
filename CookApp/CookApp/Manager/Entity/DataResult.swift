//
//  DataResult.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation
class DataResult<T:Codable>: Codable {
    var list : [T]?
    var success : Int?
}
