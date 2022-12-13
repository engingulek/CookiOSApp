//
//  SearchPageRouter.swift
//  CookApp
//
//  Created by engin gülek on 13.12.2022.
//

import Foundation

class SearchPageRouter : SearchPageRouterProtocol {
    static func createView(view: SearchViewController) {
        let presenter = SearchPagePresenter()
        view.searchPageObject = presenter
        view.searchPageObject?.interactor = SearchPageInteractor()
        view.searchPageObject?.interactor?.searchPagePresenter = presenter
        view.searchPageObject?.searchPageView = view
        
    }
    
    
}
