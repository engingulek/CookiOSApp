//
//  AddCookPageProtocol.swift
//  CookApp
//
//  Created by engin gülek on 14.12.2022.
//

import Foundation

protocol ViewToPresenterAddCookProtocol {
    var interactor :  PresenterToInteractorAddCookProtocol?{get set}
    var addCookPageView : PresenterToViewAddCookProtocol? {get set}
    func sendDataAction(addCook:Cook)
    func getCategoriesAction()
}

protocol PresenterToInteractorAddCookProtocol{
    var addCookPresenter : InteractorToPresenterAddCookProtocol? {get set}
    func sendData(addCook:Cook)
    func getCategories()
}

protocol InteractorToPresenterAddCookProtocol {
    func toPresenter(categories:Array<Category>)
}

protocol PresenterToViewAddCookProtocol {
    func toView(categories:Array<Category>)
}


protocol AddCookRouterProtocol {
    
    static func createModel(view:AddCookView)
    
}
