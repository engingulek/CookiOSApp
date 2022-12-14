//
//  AddCookPresenter.swift
//  CookApp
//
//  Created by engin gülek on 14.12.2022.
//

import Foundation

class AddCookPresenter : ViewToPresenterAddCookProtocol {
    var addCookPageView: PresenterToViewAddCookProtocol?
    var interactor: PresenterToInteractorAddCookProtocol?
    
    func sendDataAction(addCook: Cook) {
        interactor?.sendData(addCook: addCook)
    }
    
    func getCategoriesAction() {
        interactor?.getCategories()
    }
}

extension AddCookPresenter : InteractorToPresenterAddCookProtocol {
    func toPresenter(categories: Array<Category>) {
        addCookPageView?.toView(categories: categories)
    }
    
    
}
