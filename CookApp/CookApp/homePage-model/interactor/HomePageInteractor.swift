//
//  HomePageInteractor.swift
//  CookApp
//
//  Created by engin gülek on 30.10.2022.
//

import Foundation

class HomePageInteractor : PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    func getCookTrends() {
        homePagePresenter?.toTrendsCookPresenter(test: ["trends"])
    }
    
    func getCookNew() {
        homePagePresenter?.toNewCookPresenter(test: ["new"])
    }
    
  
    
 

   
    
    
}
