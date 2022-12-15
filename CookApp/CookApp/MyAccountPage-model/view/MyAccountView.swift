//
//  MyAccountPage-model.swift
//  CookApp
//
//  Created by engin gülek on 10.12.2022.
//

import UIKit
import Firebase
class MyAccountView: UIViewController {

    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var cooksButton: UIButton!
    
    @IBOutlet weak var signOutButton: UIButton!
    let userInfı = UserDefaults.standard
    @IBOutlet weak var accountView: UIView!
    
    @IBOutlet weak var myCooksCountLabel: UILabel!
    let myCooksTableView  = MyCooksTVC()
    let myLikesTableView = MyCooksLikeTVC()
    @IBOutlet weak var nameSurname: UILabel!
    var myAccountObject : ViewToPresenterMyAccountProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MyAccountRouter.createView(view: self)

        
        signOutButton.layer.cornerRadius = 20
        cooksButton.layer.cornerRadius = 20
        likesButton.layer.cornerRadius = 20
        navigationController?.navigationBar.backgroundColor = UIColor(named: "searchBarViewColor")
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        nameSurname.text = userInfı.string(forKey: "name")
        
        myAccountObject?.getCooksAction()
        myAccountObject?.getLikesAction()
    }
   
    
    
    @IBAction func toCookSelected(_ sender: Any) {
        
        self.present(myCooksTableView, animated: true)
        
        
    }
    
    @IBAction func toLiskesSelected(_ sender: Any) {
        self.present(myLikesTableView, animated: true)
    }
    

    @IBAction func singOutButton(_ sender: Any) {
        let firebaseAuth = Auth.auth()
     do {
       try firebaseAuth.signOut()
         performSegue(withIdentifier: "toFirstPage", sender: nil)
     } catch let signOutError as NSError {
       print("Error signing out: %@", signOutError)
     }
        
    }
    
    
   
}


extension MyAccountView : PresenterToViewAccountProtocol {
    
    func toMyCooksCount(myCooksCount: Int) {
        DispatchQueue.main.async {
            self.myCooksCountLabel.text = "\(myCooksCount)"
        }
    }
    
    func toLikesView(likes: Array<LikeCook>) {
        DispatchQueue.main.async {
            print("engin \(likes)")
            self.myLikesTableView.myCoookList = likes
            
        }
        
    }
    func toMyCooksView(cooks: Array<Cook>) {
        DispatchQueue.main.async {
            self.myCooksTableView.myCoookList = cooks
            
        }
        
    }
    
    
}
