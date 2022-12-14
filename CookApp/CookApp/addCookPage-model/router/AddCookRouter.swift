//
//  AddCookRouter.swift
//  CookApp
//
//  Created by engin gülek on 14.12.2022.
//

import Foundation

class AddCookRouter: AddCookRouterProtocol {
    static func createModel(view: AddCookView) {
        let presenter  =  AddCookPresenter()
        view.addCookObject = presenter
        view.addCookObject?.interactor = AddCookInteractor()
        view.addCookObject?.interactor?.addCookPresenter = presenter
        view.addCookObject?.addCookPageView = view
    }
    
    
}
