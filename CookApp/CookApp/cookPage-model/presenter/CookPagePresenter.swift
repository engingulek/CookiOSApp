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
    var categoryId : String? = "0"
    func getCooksAction() {
        interactor?.getCooks()
    }
    
    func getCategoriesAction() {
        interactor?.getCategories()
    }
    
    func getCooksAction(categoryId: String) {
        self.categoryId = categoryId
        interactor?.getCooks()
        
    }
    
    
}

extension CookPagePresenter : InteractorToPresenterCookPageProtocol {
    
    
    func toPresenterCooks(cookList: Array<Cook>) {
        if categoryId == "0" {
            cookPageView?.toViewCooks(cookList: cookList)
        }else{
            
            if let _id = categoryId {
                let filterList = cookList.filter{
                    $0.category?._id == _id
                }
                cookPageView?.toViewCooks(cookList: filterList)
            }
            
        }
    }
    
    func toPresenterCategories(categoryList: Array<Category>) {
        cookPageView?.toViewCategories(categoryList: categoryList)
    }
    
    
}
