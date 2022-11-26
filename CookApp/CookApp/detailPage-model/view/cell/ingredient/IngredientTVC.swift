//
//  IngredientTVC.swift
//  CookApp
//
//  Created by engin gülek on 5.11.2022.
//

import UIKit

protocol IngredientTVCProtocol {
    func addIngredient(row:Int)
}

class IngredientTVC: UITableViewCell {

    @IBOutlet weak var ingredientLabel: UILabel!
    var delegate : IngredientTVCProtocol?
    var cellRow: Int?
    
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addIngredient(_ sender: Any) {
        delegate?.addIngredient(row: cellRow!)
    }
}
