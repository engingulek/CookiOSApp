//
//  HomePageInteractor.swift
//  CookApp
//
//  Created by engin gülek on 30.10.2022.
//

import Foundation

class HomePageInteractor : PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    func getCookTrends() {
        var ingredients = [String]()
        ingredients.append("da")
        ingredients.append("d")
        ingredients.append("k")
        var category = Category(categoryId: "1",categoryImage: "url",categoryName: "hot")
        var trendCook = Cook(imageURL: "https://assets.bonappetit.com/photos/57ad4431f1c801a1038bcb17/1:1/w_2560%2Cc_limit/nashville-style-hot-chicken.jpg",name: "Chicken",categoryName: category,rating: "3.7",minute: "15",ingredients:ingredients ,makeNameSurname: "name surname")
        var trendsList = [Cook]()
        trendsList.append(trendCook)
        homePagePresenter?.toTrendsCookPresenter(test: trendsList)
    }
    
    func getCookNew() {
        homePagePresenter?.toNewCookPresenter(test: ["new"])
    }
    
  
    
 

   
    
    
}
