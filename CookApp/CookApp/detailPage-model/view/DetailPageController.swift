//
//  DetailPageController.swift
//  CookApp
//
//  Created by engin gülek on 31.10.2022.
//

import UIKit

class DetailPageController: UIViewController {
 
    
    @IBOutlet weak var cookNameLabel: UILabel!
    @IBOutlet var detailView: UIView!
    var ingredientsListTest = [String]()
    var addedingredientsListTest = [String]()
    
    @IBOutlet weak var ingredientTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewDesign()
        ingredientTableView.register(UINib(nibName: "IngredientTVC", bundle: nil), forCellReuseIdentifier: "ingredientCell")
        ingredientTableView.register(UINib(nibName: "ATVC", bundle: nil), forCellReuseIdentifier: "atvc")
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
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
       
       let cellHeight = ingredientTableView.layer.frame.size.height / 7
       ingredientTableView.rowHeight = cellHeight
    }
}

extension DetailPageController : UITableViewDelegate, UITableViewDataSource,IngredientTVCProtocol {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsListTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : IngredientTVC = ingredientTableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTVC
        cell.cellRow = indexPath.row
        cell.delegate = self
        cell.ingredientLabel.text = self.ingredientsListTest[indexPath.row]
        if addedingredientsListTest.contains(self.ingredientsListTest[indexPath.row]){
            cell.addButton.isHidden = true
            cell.ingredientLabel.textColor = UIColor.lightGray
        }
        return cell
        
    }
    func addIngredient(row: Int) {
        let added = self.ingredientsListTest[row]
        self.ingredientsListTest.remove(at: row)
        self.ingredientsListTest.append(added)
        self.ingredientTableView.reloadData()
        self.addedingredientsListTest.append(added)
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let added = UIContextualAction(style: .normal, title: "Added") { action,view, comletionHandler in
          
            
            
            
        }
        
        let configuraiton = UISwipeActionsConfiguration(actions: [added])
        return configuraiton
        
        
    }
   
}


