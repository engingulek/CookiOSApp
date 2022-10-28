//
//  newCookCVC.swift
//  CookApp
//
//  Created by engin gülek on 28.10.2022.
//

import UIKit

class newCookCVC: UICollectionViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        foodImageView.layer.cornerRadius = 10
        
    }

}
