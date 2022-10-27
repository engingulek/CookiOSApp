//
//  HomePageVC.swift
//  CookApp
//
//  Created by engin gülek on 26.10.2022.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var homePageSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePageSearchBar.delegate = self
        homePageSearchBar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        homePageSearchBar.searchTextField.layer.cornerRadius = 15
        //homePageSearchBar.setSearchFieldBackgroundImage(UIImage(named: "bake"), for: UIControl.State.normal)

        
    }
}

extension HomePageVC : UISearchBarDelegate {
    
}
