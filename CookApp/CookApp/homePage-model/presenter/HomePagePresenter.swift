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
    
    func getCookAction() {
        interactor?.getCook()
    }
    
        
}



extension HomePagePresenter : InteractorToPresenterHomePageProtocol{
    func toHomePagePresenter(cookList: Array<Cook>) {
        let trendCookList = Array( cookList.sorted{$0.rating! > $1.rating!}.prefix(3))
        homePageView?.toTrendsCookView(trendList: trendCookList)
        let newCookList = Array(cookList.sorted{$0.date! > $1.date!}.prefix(4))
        homePageView?.toNewCookView(newCookList: newCookList)
        
    }
}



