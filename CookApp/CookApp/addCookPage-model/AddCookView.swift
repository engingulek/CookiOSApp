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
    let cookImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addedIngredientsTableView.delegate = self
        addedIngredientsTableView.dataSource = self
        
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
}

extension AddCookView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addedIngredientsTableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "Test"
        return cell
    }
}

extension AddCookView : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cookImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
}
