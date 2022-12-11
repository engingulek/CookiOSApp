//
//  CookPageInteractor.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation

class CookPageInteractor : PresenterToInteractorCookPageProtocol {
    var cookPagePresenter: InteractorToPresenterCookPageProtocol?
    
    func getCategories() {
        var testList = [Category]()
        cookPagePresenter?.toPresenter(categoryList: testList)
    }
    
    
}
