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
    func deleteDataAction(deleteId:String)
}

protocol PresenterToInteractorAccountProtocol {
    var accountPagePresenter : InteractorToPresenterAccountProtocol? {get set}
    func getCook()
    func deleteData(deleteId:String)
    
}

protocol InteractorToPresenterAccountProtocol {
    func toAccountPagePresenter(ccokList:Array<Cook>)
}


protocol PresenterToViewAccountProtocol{
    func toLikesView(likes:Array<Cook>)
    func toMyCooksView(cooks:Array<Cook>)
    func toMyCooksCount(myCooksCount:Int)
}

protocol AccountRouterProtocol {
    static func createView(view:MyAccountView)
    static func myCooksTVC(tvc:MyCooksTVC)
}




