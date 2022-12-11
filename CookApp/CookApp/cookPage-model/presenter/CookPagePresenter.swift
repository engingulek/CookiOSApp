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
    
    func getCategoriesAction() {
        interactor?.getCategories()
        
    }
}

extension CookPagePresenter : InteractorToPresenterCookPageProtocol {
    func toPresenter(categoryList: Array<Category>) {
        cookPageView?.toView(categoryList: categoryList)
    }
    
    
}
