//
//  DetailPageProtocol.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation

protocol ViewToPresenterDetailPageProtocol {
    var interactor : PresenterToInteractorDetailPageProtocol? {get set}
    var detailPageView : PresenterToViewDetailPageProtocol? {get set}
    func addLikeAction(addCook:Cook)
}

protocol PresenterToInteractorDetailPageProtocol {
    var detailPagePresenter : InteractorToPresenterDetailPageProtocol? {get set}
    func addLike(addCook:Cook)
}


protocol InteractorToPresenterDetailPageProtocol {
    func toDetailPagePresenter(message:Int)
}

protocol PresenterToViewDetailPageProtocol {
    func toView(message:Int)
}

protocol DetailPageRouterProtocol{
    static  func createView(view:DetailPageController)
  
    
}
