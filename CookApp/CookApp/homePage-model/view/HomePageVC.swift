//
//  HomePageVC.swift
//  CookApp
//
//  Created by engin gülek on 26.10.2022.
//

import UIKit

class HomePageVC: UIViewController{
  
    

    @IBOutlet weak var homePageSearchBar: UISearchBar!
    
    @IBOutlet weak var viewToSearchBar: UIView!
    @IBOutlet weak var trendsCookCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePageSearchBar.delegate = self
        homePageSearchBar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        homePageSearchBar.searchTextField.layer.cornerRadius = 15
        trendsCookCollectionView.delegate = self
        trendsCookCollectionView.dataSource = self
        trendsCookCollectionView.register(UINib(nibName: "TrendsCVC", bundle: nil),forCellWithReuseIdentifier: "cookCell")
        
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "CategoriesCVC", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        setupUI()
        
        
        //homePageSearchBar.setSearchFieldBackgroundImage(UIImage(named: "bake"), for: UIControl.State.normal)
        
    }
    
    private func setupUI(){
        
        
        
        self.viewToSearchBar.backgroundColor = UIColor.init(named: "searchBarViewColor")
        homePageSearchBar.barTintColor  = UIColor.init(named: "searchBarViewColor")
        
        // MARK: - Collection View Design
        ///Trends CollectionView design
        let designTCV : UICollectionViewFlowLayout  = UICollectionViewFlowLayout()
        let widthTCV  = self.trendsCookCollectionView.layer.frame.size.width
        let heightTCV  = self.trendsCookCollectionView.layer.frame.size.height
        designTCV.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        designTCV.itemSize = CGSize(width: widthTCV/1.2, height: heightTCV/1.2)
        designTCV.minimumLineSpacing = 10
        designTCV.minimumInteritemSpacing = 5
        designTCV.scrollDirection = .horizontal
        self.trendsCookCollectionView.collectionViewLayout = designTCV
        
        /// Category Collection View Design
        
        let designCVC : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let widthCVC = self.categoryCollectionView.layer.frame.size.width
        let heightCVC = self.categoryCollectionView.layer.frame.size.height
        
        designCVC.sectionInset = UIEdgeInsets(top: 15, left: 5, bottom: 10, right: 5)
        designCVC.itemSize = CGSize(width: widthCVC/3.5, height: heightCVC/1.2)
        designCVC.minimumLineSpacing = 5
        designCVC.minimumInteritemSpacing = 5
        designCVC.scrollDirection = .horizontal
        self.categoryCollectionView.collectionViewLayout = designCVC
    }
}

extension HomePageVC : UISearchBarDelegate {
    
}

extension HomePageVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.trendsCookCollectionView {
            return 5
        } else {
            return 5
        }
    
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.trendsCookCollectionView {
            let cell : TrendsCVC = trendsCookCollectionView.dequeueReusableCell(withReuseIdentifier: "cookCell", for: indexPath) as! TrendsCVC
            cell.layer.cornerRadius = 20
            return cell
        }else{
            let cell : CategoriesCVC = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCVC
            
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.red.cgColor
            let widthCVC = self.categoryCollectionView.layer.frame.size.width
            let heightCVC = self.categoryCollectionView.layer.frame.size.height
            cell.layer.frame.size.height = 80
            cell.layer.frame.size.width = widthCVC/4.5
            return cell
        }
        
       
        
    }
    
    
    
}
