//
//  homePagePresenter.swift
//  CookApp
//
//  Created by engin gülek on 30.10.2022.
//

import Foundation

class HomePagePresenter : ViewToPresenterHomePageProtocol {
    var interactor: PresenterToInteractorHomePageProtocol?
    
    var homePageView: PresenterToViewHomePageProtocol?
    
    func getCookTrendsAction() {
        interactor?.getCookTrends()
    }
    
    func getCookNewAction() {
        interactor?.getCookNew()
    }
    
    
}


extension HomePagePresenter : InteractorToPresenterHomePageProtocol{
    
    
    
    
    func toTrendsCookPresenter(test: String) {
        homePageView?.toTrendsCookView(test: test)
    }
    
    func toNewCookPresenter(test: String) {
        homePageView?.toNewCookView(test: test)
    }
    
  
    
    
}



