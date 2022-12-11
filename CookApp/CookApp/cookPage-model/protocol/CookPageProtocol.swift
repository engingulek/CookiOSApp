//
//  CookPageProtocol.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation

protocol ViewToPresenterCookPageProtocol {
    var interactor : PresenterToInteractorCookPageProtocol? {get set}
    var cookPageView : PresenterToViewCookPageProtol? {get set}
    func getCategoriesAction()
}

protocol PresenterToInteractorCookPageProtocol{
    var cookPagePresenter : InteractorToPresenterCookPageProtocol? {get set}
    func getCategories()
    
}

protocol InteractorToPresenterCookPageProtocol{
    func toPresenter(categoryList:Array<Category>)
}

protocol PresenterToViewCookPageProtol{
    func toView(categoryList:Array<Category>)
}

protocol PresenterToRouterCookPageProtocol{
    static func createModel(ref:CookPageController)
}

