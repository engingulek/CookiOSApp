//
//  SearchPageProtocol.swift
//  CookApp
//
//  Created by engin gülek on 13.12.2022.
//

import Foundation


protocol ViewToPresenterSearchPageProtocol {
    var searchPageView : PresenterToViewSearchPageProtocol? {get set}
    var interactor : PresenterToInteractorSearchPageProtocol? {get set}
    func getCookAction(searchText:String)
    
}

protocol PresenterToInteractorSearchPageProtocol {
    var searchPagePresenter : InteractorToPresenterSearchPageProtocol? {get set}
    func getCook()
}

protocol InteractorToPresenterSearchPageProtocol {
    func toPresenterCookList(cookList:Array<Cook>)
}

protocol PresenterToViewSearchPageProtocol {
   func toViewSearchCookList(searchCookList:Array<Cook>)
}

protocol SearchPageRouterProtocol {
    static  func createView(view:SearchViewController)
}


