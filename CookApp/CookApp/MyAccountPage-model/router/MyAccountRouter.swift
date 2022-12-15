//
//  MyAccountRouter.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation

class MyAccountRouter : AccountRouterProtocol {
    static func myLikesTVC(tvc: MyCooksLikeTVC) {
        let presenter = MyAccountPresenter()
        tvc.myCookLikeTVCObject = presenter
        tvc.myCookLikeTVCObject?.interactor = MyAccountInteractor()
    }
    
    static func myCooksTVC(tvc: MyCooksTVC) {
        let presenter = MyAccountPresenter()
        tvc.myCookTVCObject = presenter
        tvc.myCookTVCObject?.interactor = MyAccountInteractor()
        
    }
    
    static func createView(view: MyAccountView) {
        let presenter = MyAccountPresenter()
        view.myAccountObject = presenter
        view.myAccountObject?.interactor = MyAccountInteractor()
        view.myAccountObject?.interactor?.accountPagePresenter = presenter
        view.myAccountObject?.accountView = view
    }
    
    
}
