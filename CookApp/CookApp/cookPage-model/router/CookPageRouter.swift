//
//  CookPageRouter.swift
//  CookApp
//
//  Created by engin gülek on 11.12.2022.
//

import Foundation

class CookPageRouter : PresenterToRouterCookPageProtocol {
    static func createModel(ref: CookPageController) {
        let presenter = CookPagePresenter()
        ref.cookPageObject = presenter
        ref.cookPageObject?.interactor = CookPageInteractor()
        ref.cookPageObject?.interactor?.cookPagePresenter = presenter
        ref.cookPageObject?.cookPageView = ref
        
    }
    
    
}
