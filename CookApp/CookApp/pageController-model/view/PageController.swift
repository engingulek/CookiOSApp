//
//  ViewController.swift
//  CookApp
//
//  Created by engin gülek on 26.10.2022.
//

import UIKit

class PageController: UIViewController {
    
    var slides : [Slide] = []
  

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var slideCollectionView: UICollectionView!
    
    
    var curruntPage = 0 {
        didSet {
            if curruntPage == slides.count - 1 {
                getStartedButton.isHidden = false
                
            }else{
                getStartedButton.isHidden = true
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slideCollectionView.delegate = self
        slideCollectionView.dataSource = self
        slides = [
            Slide(image: UIImage.init(named: "cooking"), title: "Cooking", description: "Cooking Desc"),
            Slide(image: UIImage.init(named: "bake"), title: "Bake", description: "Bake Desc"),
            Slide(image: UIImage.init(named: "chef"), title: "Cooking", description: "Chef Desc")
        ]
        pageController.isEnabled = false
        getStartedButton.layer.cornerRadius = 20
        
    }
    
    
    @IBAction func skipAction(_ sender: Any) {
        // Go to Sing In Page
    }
    
    @IBAction func getStartedAction(_ sender: Any) {
    }
}

extension PageController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        curruntPage = Int(scrollView.contentOffset.x/width)
        pageController.currentPage = curruntPage
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = slideCollectionView.dequeueReusableCell(withReuseIdentifier: "pageControllerCell", for: indexPath) as! PageControllerCVC
        cell.setup(slides[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: slideCollectionView.frame.width, height: slideCollectionView.frame.height)
    }
    
 
    
}

