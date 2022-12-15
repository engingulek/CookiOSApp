//
//  MyAccountPresenter.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation
let userInfo = UserDefaults.standard
class MyAccountPresenter : ViewToPresenterMyAccountProtocol {
    func getLikesAction() {
        interactor?.getLikes()
    }
    
    func deleteDataAction(deleteId: String) {
        interactor?.deleteData(deleteId: deleteId)
    }
    var interactor: PresenterToInteractorAccountProtocol?
    
    var accountView: PresenterToViewAccountProtocol?
    
    func getCooksAction() {
        interactor?.getCook()
    }
    
    
    
}


extension MyAccountPresenter : InteractorToPresenterAccountProtocol{
    func toAccountPagePresenterCook(ccokList: Array<Cook>) {
        let userId = userInfo.string(forKey: "userID")
        
        let myCooksList =  ccokList.filter{$0.userId == userId}
        accountView?.toMyCooksView(cooks: myCooksList)
        
        accountView?.toMyCooksCount(myCooksCount: myCooksList.count)
    }
    
    func toAccountPagePresenterCooksLike(ccokList: Array<LikeCook>) {
        
        accountView?.toLikesView(likes: ccokList)
    }
    
  
    
    
}
