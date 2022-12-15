//
//  DetailPageController.swift
//  CookApp
//
//  Created by engin gülek on 31.10.2022.
//

import UIKit
import Kingfisher
class IngredientAdd {
    var ingredients : [String]?
    var header : String?
    var labelColor:  UIColor?
    var buttonHiddenState : Bool?
    init(ingredients: [String]?, header: String?,labelColor: UIColor?,buttonHiddenState: Bool?) {
        self.ingredients = ingredients
        self.header = header
        self.labelColor = labelColor
        self.buttonHiddenState = buttonHiddenState
    }
}

class DetailPageController: UIViewController {
 
    @IBOutlet weak var cookImage: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var cookNameLabel: UILabel!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet var detailView: UIView!
    @IBOutlet weak var ingredientTableView: UITableView!
    var detailPageObject : ViewToPresenterDetailPageProtocol?
    var ingredientsListTest = [IngredientAdd]()
    var getIngredientsListApi = [String]()
    var addedIngredientsList = [String]()
    var cook:Cook?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewDesign()
        DetailPageRouter.createView(view: self)
        ingredientTableView.register(UINib(nibName: "IngredientTVC", bundle: nil), forCellReuseIdentifier: "ingredientCell")
        ingredientTableView.register(UINib(nibName: "ATVC", bundle: nil), forCellReuseIdentifier: "atvc")
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        getIngredientsListApi = (cook?.ingredients)!
     
        
        //ingredientsListTest.append(IngredientAdd.init(ingredients: addedIngredientsList, header: "Added Ingredients"))
        cookNameLabel.text = cook?.name
        let url = URL(string: (cook?.imageURL!)!)
        cookImage.kf.setImage(with: url)
        categoryNameLabel.text = cook?.category?.categoryName
        if let rating = cook?.rating,let minute = cook?.minute  {
            ratingLabel.text = "\(Int(rating))"
            minuteLabel.text = "\(minute)"
            
        }
        
        ingredientsListTest.append(IngredientAdd.init(ingredients: getIngredientsListApi, header: "Ingredients",labelColor: UIColor.black,buttonHiddenState: false))
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
    
    @IBAction func toStepsViewAciton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let toSteps = storyboard.instantiateViewController(withIdentifier: "stepsView") as! StepsView
        if let steps = cook?.detail {
            toSteps.steps = steps
        }
        self.present(toSteps, animated: true)

        
    }
    
    
    @IBAction func addLikeSelected(_ sender: Any) {
        detailPageObject?.addLikeAction(addCook: cook!)
    }
    
    
}

extension DetailPageController : PresenterToViewDetailPageProtocol {
    func toView(message:Int) {
        if message == 1 {
            alertMessage(title: "Success", message: "Adden cook to your like list")
        }else{
            alertMessage(title: "Warning", message: "Already on your list")
        }
        
        
    }
    
    func alertMessage(title:String,message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okey", style: .default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
        
    }
    
    
}

extension DetailPageController : UITableViewDelegate, UITableViewDataSource,IngredientTVCProtocol {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ingredientsListTest.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsListTest[section].ingredients?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : IngredientTVC = ingredientTableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTVC
        cell.cellRow = indexPath.row
        cell.delegate = self
        cell.ingredientLabel?.text = ingredientsListTest[indexPath.section].ingredients?[indexPath.row]
        cell.ingredientLabel.textColor = ingredientsListTest[indexPath.section].labelColor
        cell.addButton.isHidden  = ingredientsListTest[indexPath.section].buttonHiddenState!
        return cell
        
    }
    
 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ingredientsListTest[section].header
    }
    
    func addIngredient(row: Int) {
        let added = self.getIngredientsListApi[row]
        self.getIngredientsListApi.remove(at: row)
        self.addedIngredientsList.append(added)
        self.ingredientsListTest.removeAll()
        ingredientsListTest.append(IngredientAdd.init(ingredients: getIngredientsListApi, header: "Ingredients",labelColor: UIColor.black,buttonHiddenState: false))
        ingredientsListTest.append(IngredientAdd.init(ingredients: addedIngredientsList, header: "Added Ingredients",labelColor: UIColor.lightGray,buttonHiddenState: true))
        self.ingredientTableView.reloadData()
        
    }
}


