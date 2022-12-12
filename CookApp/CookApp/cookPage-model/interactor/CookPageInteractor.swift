//
//  CookPageInteractor.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation

class CookPageInteractor : PresenterToInteractorCookPageProtocol {
    
    var cookPagePresenter: InteractorToPresenterCookPageProtocol?
    
    func getCategories() {
        APICaller.shared.fetchData(router: Constant.getCategoryRouter) { (response:Result<[Category]?,Error>) in
            switch response {
            case .success(let list):
                self.cookPagePresenter?.toPresenterCategories(categoryList: list!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCooks() {
        APICaller.shared.fetchData(router: Constant.getCookRouter) { (response:Result<[Cook]?,Error>) in
            switch response {
            case .success(let list):
                self.cookPagePresenter?.toPresenterCooks(cookList: list!)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}



