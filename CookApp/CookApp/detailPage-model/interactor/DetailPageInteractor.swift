//
//  DetailPageInteractor.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import Foundation

class DetailPageInteractor : PresenterToInteractorDetailPageProtocol {
    var detailPagePresenter: InteractorToPresenterDetailPageProtocol?
    
    func addLike(addCook: Cook) {
        APICaller.shared.sendData(getrouter: AddRouter.addLike , data: addCook) { result in
            switch result {
            case .success(let result):
             
                self.detailPagePresenter?.toDetailPagePresenter(message: result! )
            case  .failure(let error):
                print("Send cook \(error)")
            }
        }
    }
    
    
}
