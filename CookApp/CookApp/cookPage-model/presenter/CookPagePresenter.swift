//
//  CookPagePresenter.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation

class CookPagePresenter : ViewToPresenterCookPageProtocol {
    var interactor: PresenterToInteractorCookPageProtocol?
    
    var cookPageView: PresenterToViewCookPageProtol?
   
    
    func getCooksAction() {
        interactor?.getCooks()
    }
    
    func getCategoriesAction() {
        interactor?.getCategories()
        
    }
}

extension CookPagePresenter : InteractorToPresenterCookPageProtocol {
    
    func toPresenterCooks(cookList: Array<Cook>) {
        cookPageView?.toViewCooks(cookList: cookList)
    }
    
    func toPresenterCategories(categoryList: Array<Category>) {
        cookPageView?.toViewCategories(categoryList: categoryList)
    }
    
    
}
