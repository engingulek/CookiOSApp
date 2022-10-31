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
    func toTrendsCookPresenter(test:Array<Cook>)
    func toNewCookPresenter(test:Array<String>)
    

     
}

protocol PresenterToViewHomePageProtocol {
    func toTrendsCookView(test:Array<Cook>)
    func toNewCookView(test:Array<String>)

       
    
    
    
}

protocol HomePageRouterProtocol{
    
  static  func createView(view:HomePageVC)
    
}
