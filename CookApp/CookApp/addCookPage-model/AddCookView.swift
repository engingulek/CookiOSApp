//
//  AddCookView.swift
//  CookApp
//
//  Created by engin gülek on 9.12.2022.
//

import UIKit

class AddCookView: UIViewController {
    @IBOutlet weak var addedIngredientsTableView: UITableView!
    @IBOutlet weak var cookImageView: UIImageView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBOutlet weak var ingredientsTextField: UITextField!
    let cookImagePicker = UIImagePickerController()
    let categorySourceTest = ["New","Soup","Meat","Dinner","Breakfeast","Lauch","Drink"]
    var ingredient:String?
    var addedIngredientsList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addedIngredientsTableView.delegate = self
        addedIngredientsTableView.dataSource = self
        
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        // Mark  - imageview click feature
        cookImageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cookImageSelect))
        cookImageView.addGestureRecognizer(gestureRecognizer)
        
        
    }
    @objc func cookImageSelect(){
        print("Image select")
        cookImagePicker.delegate = self
        cookImagePicker.sourceType = .photoLibrary
        self.present(cookImagePicker, animated: true)
    }
    
    func alertMessage(title:String,message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okey", style: .default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
        
    }
    
    @IBAction func addIngredientsSelected(_ sender: Any) {
        if ingredientsTextField.text == "" {
            alertMessage(title: "Warning", message: "Please enter a ingredient")
        }else{
            ingredient = ingredientsTextField.text
            addedIngredientsList.append(ingredient!)
            addedIngredientsTableView.reloadData()
            ingredientsTextField.text = ""
        }
    }
    
    
    
}

// Mark - UITableView
extension AddCookView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedIngredientsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addedIngredientsTableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = addedIngredientsList[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredients"
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action,view, comletionHandler in
            self.addedIngredientsList.remove(at: indexPath.row)
            self.addedIngredientsTableView.reloadData()
        }
        let configuraiton = UISwipeActionsConfiguration(actions: [delete])
    return configuraiton
    }
}
// Mark - UIImagePickerController
extension AddCookView : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cookImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
}
// Mark - UIPickerView
extension AddCookView : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorySourceTest.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorySourceTest[row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(categorySourceTest[indexPath.row])
    }
    
    
}
