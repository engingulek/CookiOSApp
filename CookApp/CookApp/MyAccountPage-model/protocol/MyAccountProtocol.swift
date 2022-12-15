//
//  MyAccountProtocol.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation


protocol ViewToPresenterMyAccountProtocol {
    var interactor : PresenterToInteractorAccountProtocol? {get set}
    var accountView : PresenterToViewAccountProtocol? {get set}
    func getCooksAction()
    func getLikesAction()
    func deleteDataAction(deleteId:String)
}



protocol PresenterToInteractorAccountProtocol {
    var accountPagePresenter : InteractorToPresenterAccountProtocol? {get set}
    func getCook()
    func getLikes()
    func deleteData(deleteId:String)
    
}

protocol InteractorToPresenterAccountProtocol {
    func toAccountPagePresenterCook(ccokList:Array<Cook>)
    func toAccountPagePresenterCooksLike(ccokList:Array<LikeCook>)
}


protocol PresenterToViewAccountProtocol{
    func toLikesView(likes:Array<LikeCook>)
    func toMyCooksView(cooks:Array<Cook>)
    func toMyCooksCount(myCooksCount:Int)
}

protocol AccountRouterProtocol {
    static func createView(view:MyAccountView)
    static func myCooksTVC(tvc:MyCooksTVC)
    static func myLikesTVC(tvc:MyCooksLikeTVC)
}




