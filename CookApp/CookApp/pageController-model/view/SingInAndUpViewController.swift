//
//  SingInAndUpViewController.swift
//  CookApp
//
//  Created by engin gülek on 14.12.2022.
//

import UIKit
import Firebase
class SingInAndUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var singUpButton: UIButton!
    
    @IBOutlet weak var singInButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let singInUpRef = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        nameSurnameTextField.isHidden = true
        singUpButton.isHidden = true
    }
    
    @IBAction func segmentedControlClicked(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            nameSurnameTextField.isHidden = true
            singUpButton.isHidden = true
            break
        case 1:
            nameSurnameTextField.isHidden = false
            singUpButton.isHidden = false
            singInButton.isHidden = true
            break
        default:
            break
        }
    }
    @IBAction func singInClicked(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){authResult,error in
                if error != nil{
                    self.alertMessage(title: "Warning", text: "\(error!.localizedDescription)")
                }else{
                    let name = Auth.auth().currentUser?.displayName
                    let userID = Auth.auth().currentUser?.uid
                    self.singInUpRef.set(name, forKey: "name")
                    self.singInUpRef.set(userID, forKey: "userID")
                    self.performSegue(withIdentifier: "toView", sender: nil)
                }
            }
        }else{
            self.alertMessage(title: "Warning", text: "Email or password is empty")
            
        }
    }
    
   
    @IBAction func singUpClicked(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!,
                                   password: passwordTextField.text!){ (authData, error) in
                if error != nil {
                    self.alertMessage(title: "Hata", text: error!.localizedDescription)
                }else{
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.nameSurnameTextField.text
                    changeRequest?.commitChanges(completion: { error in
                        if error == nil {
                           let uid = Auth.auth().currentUser?.uid
                            self.singInUpRef.set(self.nameSurnameTextField.text, forKey: "name")
                            self.singInUpRef.set(uid, forKey: "userID")
                            self.performSegue(withIdentifier: "toView", sender: nil)
                        }
                    })
                }}
        }else{
            self.alertMessage(title: "Warning", text: "Email or password is empty")
        }
    }
    
    func alertMessage(title:String,text:String){
        let alertMessage = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Okey", style: .cancel)
        alertMessage.addAction(alertButton)
        self.present(alertMessage, animated: true)
    }
    
}
