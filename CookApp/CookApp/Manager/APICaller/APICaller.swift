//
//  APICaller.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation
import Alamofire


enum AddRouter : String {
    case addCook =  "addCook"
    case addLike = "addLike"
}

enum DeleteRouter : String {
    case deleteMyCook  = "deleteData"
}


struct Constant {
    static let baseURL = "http://localhost:3000/"
    static let getCategoryRouter = "categories"
    static let getCookRouter = "cooks"
    static let deleteData = "deleteData"
    static let getLike = "likes"
    
}

class APICaller {
    static let shared = APICaller()
    
    func fetchData<T:Codable>(getrouter:String,completion:@escaping(Result<[T]?,Error>)->()){
        let url = "\(Constant.baseURL)\(getrouter)"
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
    
    
    
    
    
    
    func sendData(getrouter:AddRouter,data:Cook,completion:@escaping(Result<Int?,Error>)->()){
        let router: AddRouter = getrouter
        var url = ""
        let userInfo = UserDefaults.standard
        let userId = userInfo.string(forKey: "userID")
        var params : Parameters = [:]
        switch router {
        case .addCook:
            url = "\(Constant.baseURL)\(router)"
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            _ = formatter.date(from: "\(currentDate)")
            params  = ["userId" : userId!,
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
        case .addLike:
            url = "\(Constant.baseURL)\(router)"
            params = ["cookId":data._id!,"userId":userId!]
        }
        
        AF.request(url,method: .post,parameters: params,encoding: JSONEncoding.init()).response{ response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(SendDataResult.self, from: data)
                   // let result = try JSONSerialization.jsonObject(with: data)
                    completion(.success(result.success))
                    print(result)
                }catch{
                    print("Send Data Error \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    func deleteData(router:String,deleteId:String,completion:@escaping(Result<String,Error>)->()){
            let url = "\(Constant.baseURL)\(router)"
            let param = ["deleteId" :deleteId]
            print(deleteId)
            AF.request(url,method: .post,parameters: param,encoding: JSONEncoding.init()).response{ response in
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
    
    
    func fetchResulrData<T:Codable>(getrouter:String,completion:@escaping(Result<[T]?,Error>)->()){
        let userInfo = UserDefaults.standard
        let userId = userInfo.string(forKey: "userID")
        let param : Parameters = ["userId":userId! ]
        let url = "\(Constant.baseURL)\(getrouter)"
        AF.request(url,method: .post,parameters: param,encoding: JSONEncoding.init()).response{ response in
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



















