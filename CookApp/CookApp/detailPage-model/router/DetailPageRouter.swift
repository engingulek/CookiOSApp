//
//  DetailPageRouter.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation

class DetailPageRouter : DetailPageRouterProtocol {
    static func createView(view: DetailPageController) {
        let presenter = DetailPagePresenter()
        view.detailPageObject = presenter
        view.detailPageObject?.interactor = DetailPageInteractor()
        view.detailPageObject?.interactor?.detailPagePresenter = presenter
        view.detailPageObject?.detailPageView = view
        
    }
    
    
}
