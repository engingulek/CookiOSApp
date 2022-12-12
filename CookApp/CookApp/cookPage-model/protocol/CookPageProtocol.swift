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
    // MARK: - View Action
    
    ///Categories data action
    func getCategoriesAction()
    
    /// Cook data action
     func getCooksAction()
    func getCooksAction(categoryId:String)
    
 
   

}

protocol PresenterToInteractorCookPageProtocol{
    var cookPagePresenter : InteractorToPresenterCookPageProtocol? {get set}
    // MARK: - Interaction Action
    
    /// Categories fetch data
    func getCategories()
    
    /// Cook fetch data
    func getCooks()
    
    
}

protocol InteractorToPresenterCookPageProtocol{


    // MARK: toPresenter
    
    /// toPresenter categories
    func toPresenterCategories(categoryList:Array<Category>)
    
    /// toPresenter cooks
    func toPresenterCooks(cookList:Array<Cook>)
    
   
   
}

protocol PresenterToViewCookPageProtol{
    
    // MARK: toView
    
    /// toView categories
    func toViewCategories(categoryList:Array<Category>)
    
    /// toView Cooks
     func toViewCooks(cookList:Array<Cook>)
    
    
    
    
}

protocol PresenterToRouterCookPageProtocol{
    static func createModel(ref:CookPageController)
}

