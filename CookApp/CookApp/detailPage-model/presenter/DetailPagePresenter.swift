//
//  DetailPagePresenter.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation

class DetailPagePresenter : ViewToPresenterDetailPageProtocol {
    var interactor: PresenterToInteractorDetailPageProtocol?
    
    var detailPageView: PresenterToViewDetailPageProtocol?
    
    func addLikeAction(addCook: Cook) {
        interactor?.addLike(addCook: addCook)
    }
    
    
}

extension DetailPagePresenter : InteractorToPresenterDetailPageProtocol {
    func toDetailPagePresenter(message: Int) {
        detailPageView?.toView(message: message)
    }
    
    
    
    
}
