//
//  HomePageRouter.swift
//  CookApp
//
//  Created by engin gülek on 30.10.2022.
//

import Foundation

class HomePageRouter : HomePageRouterProtocol {
    static func createView(view: HomePageVC) {
        let presenter = HomePagePresenter()
        view.homePageObject = presenter
        view.homePageObject?.interactor = HomePageInteractor()
        view.homePageObject?.interactor?.homePagePresenter = presenter
        view.homePageObject?.homePageView = view
        
    }
    
    
}
