//
//  APICaller.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation
import Alamofire

struct Constant {
    static let baseURL = "http://localhost:3000/"
    static let getCategoryRouter = "categories"
    static let getCookRouter = "cooks"
}

class APICaller {
    static let shared = APICaller()
    
    func fetchData<T:Codable>(router:String,completion:@escaping(Result<[T]?,Error>)->()){
        let url = "\(Constant.baseURL)\(router)"
        AF.request(url,method: .get).response{ response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(DataResult<T>.self, from: data)
                    completion(.success(result.list))
                }catch{
                    completion(.failure(error))
                    print("Deneme \(error)")
                }
            }
        }
        
    }
}
