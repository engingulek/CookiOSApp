//
//  AddCookView.swift
//  CookApp
//
//  Created by engin gülek on 9.12.2022.
//

import UIKit
import Firebase
import FirebaseStorage

class AddCookView: UIViewController {
    @IBOutlet weak var addedIngredientsTableView: UITableView!
    @IBOutlet weak var cookImageView: UIImageView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBOutlet weak var stepTableView: UITableView!
    @IBOutlet weak var cookNameTextField: UITextField!
    
    @IBOutlet weak var cookStepsTextField: UITextField!
    @IBOutlet weak var cookMinuteTextField: UITextField!
    @IBOutlet weak var ingredientsTextField: UITextField!
    let cookImagePicker = UIImagePickerController()
    var categorySource = [Category]()
    var selectedCategory:Category?
    var ingredient:String?
    var addedIngredientsList = [String]()
    var addCookObject : ViewToPresenterAddCookProtocol?
    var addedStepsList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addedIngredientsTableView.delegate = self
        addedIngredientsTableView.dataSource = self
        
            
        stepTableView.delegate = self
        stepTableView.dataSource = self
        
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        // Mark  - imageview click feature
        cookImageView.isUserInteractionEnabled = true
        cookImageView.restorationIdentifier = "addImage"
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cookImageSelect))
        cookImageView.addGestureRecognizer(gestureRecognizer)
        
        AddCookRouter.createModel(view: self)
        addCookObject?.getCategoriesAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addCookObject?.getCategoriesAction()
    }
    
    @objc func cookImageSelect(){
        cookImagePicker.delegate = self
        cookImagePicker.sourceType = .photoLibrary
        cookImageView.restorationIdentifier = "cookImage"
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
    
    @IBAction func addStepsSelected(_ sender: Any) {
        if cookStepsTextField.text == "" {
            alertMessage(title: "Warning", message: "Please enter a step")
        }else{
            let addedStep = cookStepsTextField.text
            addedStepsList.append(addedStep!)
            stepTableView.reloadData()
            cookStepsTextField.text = ""
        }
    }
    
    
    
    @IBAction func saveCookClicked(_ sender: Any) {
            if cookNameTextField.text == "" ||
            cookMinuteTextField.text == "" ||
            cookImageView.restorationIdentifier == "addImage" {
            alertMessage(title: "Warning", message: "Please enter a empty")
        }else{
            if addedIngredientsList.count < 5 && addedStepsList.count < 5 {
                alertMessage(title: "Warning", message: "Ingredients or Steps count must least 5")
            }else{
                var imageurl = ""
                let randomID = UUID.init().uuidString
                let uploadRef = Storage.storage().reference(withPath: "cooiOSApp/\(randomID).jpg")
                guard let imageData = cookImageView.image?.jpegData(compressionQuality: 0.75) else {return}
                let uploadMetadata  = StorageMetadata.init()
                uploadMetadata.contentType = "image/jpeg"
                
                uploadRef.putData(imageData,metadata: uploadMetadata){ dowloadMetaData,error in
                    if let error = error {
                        print(error.localizedDescription)
                    }else{
                        uploadRef.downloadURL { url, error in
                            imageurl = url!.absoluteString
                            let newCook = Cook(userId: "",imageURL: imageurl,
                                               name: self.cookNameTextField.text,
                                               category: self.selectedCategory,
                                               detail: self.addedStepsList,
                                               rating: 0,
                                               minute: Int(self.cookMinuteTextField.text!),
                                               ingredients: self.addedIngredientsList,
                                               date: "b")
                            self.addCookObject?.sendDataAction(addCook: newCook)
                            self.cookNameTextField.text = ""
                            self.cookMinuteTextField.text = ""
                            self.addedIngredientsList = []
                            self.addedStepsList = []
                            self.categoryPickerView.reloadAllComponents()
                            self.cookImageView.image = UIImage(named: "addImage")
                            self.addedIngredientsTableView.reloadData()
                            self.stepTableView.reloadData()
                        }
                    }
                    
                }
                
                
                
                
                
                
            }
           
        }
    }
    
}


extension AddCookView : PresenterToViewAddCookProtocol {
    func toView(categories: Array<Category>) {
        self.categorySource = categories
        print("Add cokk \(self.categorySource[0].categoryName!)")
        DispatchQueue.main.async {
            self.selectedCategory = self.categorySource[0]
            self.categoryPickerView.reloadAllComponents()
        }
    
    }
    
    
}


// MARK: - UITableView
extension AddCookView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.addedIngredientsTableView
        {
            return addedIngredientsList.count
        }else{
            return addedStepsList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.addedIngredientsTableView {
            let cell = addedIngredientsTableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = addedIngredientsList[indexPath.row]
            cell.textLabel?.textAlignment = .center
            return cell
        }else{
            let cell = stepTableView.dequeueReusableCell(withIdentifier: "stepCell")!
            cell.textLabel?.text = "\(indexPath.row+1). \(addedStepsList[indexPath.row])"
            cell.textLabel?.textAlignment = .center
            return cell
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == self.addedIngredientsTableView {
            return "Ingredients"
        }else{
            return "Steps"
        }
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action,view, comletionHandler in
            if tableView == self.addedIngredientsTableView {
                self.addedIngredientsList.remove(at: indexPath.row)
                self.addedIngredientsTableView.reloadData()
            }else{
                self.stepTableView.reloadData()
            }
            
        }
        let configuraiton = UISwipeActionsConfiguration(actions: [delete])
    return configuraiton
    }
}
// MARK: - UIImagePickerController
extension AddCookView : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cookImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
}
// MARK: - UIPickerView
extension AddCookView : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorySource.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorySource[row].categoryName
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categorySource[indexPath.row]
        
    }
    
    
}
