//
//  HomePagePresenter.swift
//  CookApp
//
//  Created by engin gülek on 30.10.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol {
    var interactor : PresenterToInteractorHomePageProtocol? {get set}
    var homePageView : PresenterToViewHomePageProtocol? {get set}
    func getCookTrendsAction()
    func getCookNewAction()
    
    
}

protocol PresenterToInteractorHomePageProtocol {
    var homePagePresenter : InteractorToPresenterHomePageProtocol? {get set}
    func getCookTrends()
    func getCookNew()
}


protocol InteractorToPresenterHomePageProtocol {
    func toTrendsCookPresenter(test:String)
    func toNewCookPresenter(test:String)
}

protocol PresenterToViewHomePageProtocol {
    func toTrendsCookView(test:String)
    func toNewCookView(test:String)
    
    
}

protocol HomePageRouterProtocol{
    
  static  func createView(view:HomePageVC)
    
}
