//
//  SearchPagePresenter.swift
//  CookApp
//
//  Created by engin gülek on 13.12.2022.
//

import Foundation

class SearchPagePresenter : ViewToPresenterSearchPageProtocol {
    var searchPageView: PresenterToViewSearchPageProtocol?
    var interactor: PresenterToInteractorSearchPageProtocol?
    var searchTxt : String?
    func getCookAction(searchText: String) {
        searchTxt = searchText
        interactor?.getCook()
    }
}

extension SearchPagePresenter : InteractorToPresenterSearchPageProtocol{
    func toPresenterCookList(cookList: Array<Cook>) {
       // let list3 = englishBooks.filter{ ($0.nameOfBook.contains("English")) }
        var filterList = [Cook]()
        for cook in cookList {
            if ((cook.name!.uppercased().contains((searchTxt?.uppercased())!)) ) {
                filterList.append(cook)
            }
        }
        searchPageView?.toViewSearchCookList(searchCookList: filterList)
        //let filterList = cookList.filter{($0.name?.lowercased().contains(where: searchTxt?.lowercased()),}
      //  searchPageView?.toViewSearchCookList(searchCookList: filterList)
        
    }
    
    
}
