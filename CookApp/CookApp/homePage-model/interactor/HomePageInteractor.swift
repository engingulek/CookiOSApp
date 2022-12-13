//
//  HomePageInteractor.swift
//  CookApp
//
//  Created by engin gülek on 30.10.2022.
//

import Foundation

class HomePageInteractor : PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    func getCook() {
        APICaller.shared.fetchData(router: Constant.getCookRouter) { (response:Result<[Cook]?,Error>) in
            switch response {
            case .success(let list):
                self.homePagePresenter?.toHomePagePresenter(cookList: list!)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
   
    
  
    
 

   
    
    
}
