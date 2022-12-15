//
//  SearchPageInteractor.swift
//  CookApp
//
//  Created by engin gülek on 13.12.2022.
//

import Foundation

class SearchPageInteractor : PresenterToInteractorSearchPageProtocol{
    var searchPagePresenter: InteractorToPresenterSearchPageProtocol?
    
    func getCook() {
        APICaller.shared.fetchData(getrouter: Constant.getCookRouter) { (response:Result<[Cook]?,Error>) in
            switch response {
            case .success(let list):
                self.searchPagePresenter?.toPresenterCookList(cookList: list!)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    
}
