//
//  DetailPageController.swift
//  CookApp
//
//  Created by engin gülek on 31.10.2022.
//

import UIKit

class DetailPageController: UIViewController{
  

    @IBOutlet weak var ingredientsCollectionView: UICollectionView!
    
    
    @IBOutlet weak var cookNameLabel: UILabel!
    @IBOutlet var detailView: UIView!
    var ingredientsListTest = [String]()
    var addedingredientsListTest = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewDesign()
        ingredientsCollectionView.register(UINib(nibName: "IngredientsCVC", bundle: nil), forCellWithReuseIdentifier: "ingredientsCell")
   
        ingredientsCollectionView.delegate = self
        ingredientsCollectionView.dataSource = self
        
        ingredientsListTest.append("A")
        ingredientsListTest.append("B")
        ingredientsListTest.append("C")
        ingredientsListTest.append("D")
        ingredientsListTest.append("E")
        ingredientsListTest.append("F")
        ingredientsListTest.append("G")
    
    }
    
   private func detailViewDesign(){
        self.tabBarController?.tabBar.isHidden = true
        cookNameLabel.layer.masksToBounds = true
        cookNameLabel.layer.cornerRadius = 20
        cookNameLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        cookNameLabel.layer.cornerRadius = 20
        detailView.layer.shadowColor = UIColor.red.cgColor
        detailView.layer.shadowOpacity = 0.2
    
        detailView.layer.shadowRadius = 10
        detailView.layer.cornerRadius = 20
    }
}

extension DetailPageController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredientsListTest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : IngredientsCVC = ingredientsCollectionView.dequeueReusableCell(withReuseIdentifier: "ingredientsCell", for: indexPath) as! IngredientsCVC
        cell.indexPathRow = indexPath.row
        cell.ingredientLabel.text = ingredientsListTest[indexPath.row]
        return cell
    }
}
