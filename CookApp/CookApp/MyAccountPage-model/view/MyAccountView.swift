//
//  MyAccountPage-model.swift
//  CookApp
//
//  Created by engin gülek on 10.12.2022.
//

import UIKit

class MyAccountView: UIViewController {

    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var cooksButton: UIButton!
    
    @IBOutlet weak var signOutButton: UIButton!
    
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var profilImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        profilImageView.layer.cornerRadius = 30
        signOutButton.layer.cornerRadius = 20
        cooksButton.layer.cornerRadius = 20
        likesButton.layer.cornerRadius = 20
        navigationController?.navigationBar.backgroundColor = UIColor(named: "searchBarViewColor")
        navigationController?.navigationBar.barTintColor = UIColor.white
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
