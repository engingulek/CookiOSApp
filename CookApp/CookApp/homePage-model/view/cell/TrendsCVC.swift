//
//  TrendsCVC.swift
//  CookApp
//
//  Created by engin gülek on 27.10.2022.
//

import UIKit

class TrendsCVC: UICollectionViewCell {

    @IBOutlet weak var cookImageView: UIImageView!
    @IBOutlet weak var cookView: UIView!
    @IBOutlet weak var cookNameLabel: UILabel!
    @IBOutlet weak var cookCategoryLabel: UILabel!
    @IBOutlet weak var cookRatingLabel: UILabel!
    @IBOutlet weak var cookMinunteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cookView.layer.cornerRadius = 20
        cookView.layer.zPosition = 1
        cookImageView.layer.zPosition = 0
        
    }

}
