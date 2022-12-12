//
//  CookPagePresenter.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation

class CookPagePresenter : ViewToPresenterCookPageProtocol {
    func getCooksAction() {
        <#code#>
    }
    
    var interactor: PresenterToInteractorCookPageProtocol?
    
    var cookPageView: PresenterToViewCookPageProtol?
    
    func getCategoriesAction() {
        interactor?.getCategories()
        
    }
}

extension CookPagePresenter : InteractorToPresenterCookPageProtocol {
    
    func toPresenterCooks(cookList: Array<Cook>) {
    }
    
    func toPresenterCategories(categoryList: Array<Category>) {
        cookPageView?.toViewCategories(categoryList: categoryList)
    }
    
    
}
