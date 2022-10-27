//
//  HomePageVC.swift
//  CookApp
//
//  Created by engin gülek on 26.10.2022.
//

import UIKit

class HomePageVC: UIViewController{
  
    

    @IBOutlet weak var homePageSearchBar: UISearchBar!
    
    @IBOutlet weak var trendsCookCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homePageSearchBar.delegate = self
        homePageSearchBar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        homePageSearchBar.searchTextField.layer.cornerRadius = 15
        trendsCookCollectionView.delegate = self
        trendsCookCollectionView.dataSource = self
        trendsCookCollectionView.register(UINib(nibName: "TrendsCVC", bundle: nil),forCellWithReuseIdentifier: "cookCell")
        setupUI()
        
        
        //homePageSearchBar.setSearchFieldBackgroundImage(UIImage(named: "bake"), for: UIControl.State.normal)
        
    }
    
    private func setupUI(){
        let design : UICollectionViewFlowLayout  = UICollectionViewFlowLayout()
        let widthTCV  = self.trendsCookCollectionView.layer.frame.size.width
        let heightTCV  = self.trendsCookCollectionView.layer.frame.size.height
        design.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        design.itemSize = CGSize(width: widthTCV/1.2, height: heightTCV/1.2)
        design.minimumLineSpacing = 10
        design.minimumInteritemSpacing = 5
        design.scrollDirection = .horizontal
        self.trendsCookCollectionView.collectionViewLayout = design
    }
}

extension HomePageVC : UISearchBarDelegate {
    
}

extension HomePageVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TrendsCVC = trendsCookCollectionView.dequeueReusableCell(withReuseIdentifier: "cookCell", for: indexPath) as! TrendsCVC
        cell.layer.cornerRadius = 20
        
        return cell
        
    }
    
    
    
}
