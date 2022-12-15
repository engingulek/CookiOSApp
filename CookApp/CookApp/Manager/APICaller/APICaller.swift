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
    static let addCook = "addCook"
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
    
    
    func sendData(router:String,data:Cook,completion:@escaping(Result<String?,Error>)->()){
        let url = "\(Constant.baseURL)\(router)"
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        _ = formatter.date(from: "\(currentDate)")
        /*formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
         let parsedDate = formatter.date(from: "\(currentDate)")*/
        print(currentDate)
        let userInfo = UserDefaults.standard
        let userId = userInfo.string(forKey: "userID")
        let params : Parameters = [  "userId" : userId!,
                                   "imageURL":data.imageURL!,
                                   "name":data.name!,
                                   "category" : [
                                    "_id":data.category?._id,
                                    "categoryName":data.category?.categoryName
                                   ],
                                   "detail":data.detail!,
                                   "rating":data.rating!,
                                   "minute":data.minute!,
                                   "date" : "\(currentDate)",
                                   "ingredients":data.ingredients!]
        print(params)
        AF.request(url,method: .post,parameters: params,encoding: JSONEncoding.init()).response{ response in
            if let data = response.data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data)
                    completion(.success("success"))
                    print(result)
                }catch{
                    print("Send Data Error \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            
        }
    }
}



















