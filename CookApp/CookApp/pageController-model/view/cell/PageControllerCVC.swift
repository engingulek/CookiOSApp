//
//  PageControllerCVC.swift
//  CookApp
//
//  Created by engin gülek on 26.10.2022.
//

import Foundation
import UIKit


class PageControllerCVC : UICollectionViewCell {
    
   
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTileLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    func setup(_ slide : Slide) {
        slideImageView.image = slide.image
        slideTileLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
