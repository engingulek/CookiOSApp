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
    func getCookAction()

    
   
    
    
}

protocol PresenterToInteractorHomePageProtocol {
    var homePagePresenter : InteractorToPresenterHomePageProtocol? {get set}
   func getCook()
}


protocol InteractorToPresenterHomePageProtocol {
    func toHomePagePresenter(cookList:Array<Cook>)
    

     
}

protocol PresenterToViewHomePageProtocol {
    func toTrendsCookView(trendList:Array<Cook>)
    func toNewCookView(newCookList:Array<Cook>)

       
    
    
    
}

protocol HomePageRouterProtocol{
    
  static  func createView(view:HomePageVC)
    
}
