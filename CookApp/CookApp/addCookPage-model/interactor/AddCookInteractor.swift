//
//  AddCookInteractor.swift
//  CookApp
//
//  Created by engin gülek on 14.12.2022.
//

import Foundation

class AddCookInteractor: PresenterToInteractorAddCookProtocol {
    var addCookPresenter: InteractorToPresenterAddCookProtocol?
    
    func getCategories() {
        APICaller.shared.fetchData(getrouter: Constant.getCategoryRouter) { (response:Result<[Category]?,Error>) in
            switch response {
            case .success(let list):
                self.addCookPresenter?.toPresenter(categories: list!)
                print("Categorie addd cook \(list)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func sendData(addCook: Cook) {
        APICaller.shared.sendData(getrouter: AddRouter.addCook , data: addCook) { result in
            switch result {
            case .success(let result):
                print("Send cook \(result ?? 0)")
            case  .failure(let error):
                print("Send cook \(error)")
            }
        }
    }
}
