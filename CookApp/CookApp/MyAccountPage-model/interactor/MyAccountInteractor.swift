//
//  MyAccountInteractor.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation

class MyAccountInteractor : PresenterToInteractorAccountProtocol {
    func getLikes() {
        
        APICaller.shared.fetchResulrData(getrouter: Constant.getLike) { (response:Result<[LikeCook]?,Error>) in
            switch response {
            case .success(let list):
                print("Aga list \(list)")
                self.accountPagePresenter?.toAccountPagePresenterCooksLike(ccokList: list!)
            case .failure(let error):
                print(error)
            }
        }
       
    }
    
    func deleteData(deleteId: String) {
        APICaller.shared.deleteData(router: Constant.deleteData, deleteId: deleteId) { result in
            switch result {
            case .success(let result):
                print("Send cook \(result )")
            case  .failure(let error):
                print("Send cook \(error)")
            }
        }
    }
    
    var accountPagePresenter: InteractorToPresenterAccountProtocol?
    
    func getCook() {
        APICaller.shared.fetchData(getrouter: Constant.getCookRouter) { (response:Result<[Cook]?,Error>) in
            switch response {
            case .success(let list):
                self.accountPagePresenter?.toAccountPagePresenterCook(ccokList: list!)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
  
    
}
