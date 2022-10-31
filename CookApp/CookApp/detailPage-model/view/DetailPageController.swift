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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        cookNameLabel.layer.masksToBounds = true
        cookNameLabel.layer.cornerRadius = 20
        cookNameLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        cookNameLabel.layer.cornerRadius = 20
        detailView.layer.shadowColor = UIColor.red.cgColor
        detailView.layer.shadowOpacity = 0.2
    
        detailView.layer.shadowRadius = 10
        detailView.layer.cornerRadius = 20
        /*detailView.layer.cornerRadius = 20
        detailView.layer.shadowColor = UIColor.lightGray.cgColor
        detailView.layer.shadowRadius = 15*/
      

    
    }
    


}
