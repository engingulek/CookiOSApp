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
    @IBOutlet weak var cookCollectionView: UICollectionView!
    var homePageObject : ViewToPresenterHomePageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomePageRouter.createView(view: self)
        homePageSearchBar.delegate = self
        homePageSearchBar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        homePageSearchBar.searchTextField.layer.cornerRadius = 15
        trendsCookCollectionView.delegate = self
        trendsCookCollectionView.dataSource = self
        trendsCookCollectionView.register(UINib(nibName: "TrendsCVC", bundle: nil),forCellWithReuseIdentifier: "cookCell")
        
        cookCollectionView.delegate = self
        cookCollectionView.dataSource = self
        cookCollectionView.register(UINib(nibName: "newCookCVC", bundle: nil), forCellWithReuseIdentifier: "newCookCell")
        setupUI()
        homePageObject?.getCookNewAction()
        homePageObject?.getCookTrendsAction()
    }
    
    private func setupUI(){
        self.viewToSearchBar.backgroundColor = UIColor.init(named: "searchBarViewColor")
        homePageSearchBar.barTintColor  = UIColor.init(named: "searchBarViewColor")
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
        let widthCVC = self.cookCollectionView.layer.frame.size.width
        let heightCVC = self.cookCollectionView.layer.frame.size.height
        
        designCVC.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 10, right: 0)
        designCVC.itemSize = CGSize(width: widthCVC, height: heightCVC/4)
        designCVC.minimumLineSpacing = 30
        designCVC.minimumInteritemSpacing = 40
        designCVC.scrollDirection = .vertical
        self.cookCollectionView.collectionViewLayout = designCVC
    }
}

extension  HomePageVC : PresenterToViewHomePageProtocol {
    func toTrendsCookView(test: Array<String>) {
  
        
    }
    
    func toNewCookView(test: Array<String>) {
       
  
    }
    
    
}


extension HomePageVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.trendsCookCollectionView {
            
          
            
            let cell : TrendsCVC = trendsCookCollectionView.dequeueReusableCell(withReuseIdentifier: "cookCell", for: indexPath) as! TrendsCVC
            cell.layer.cornerRadius = 20
            return cell
        }else{
            
            let cell : newCookCVC = cookCollectionView.dequeueReusableCell(withReuseIdentifier: "newCookCell", for: indexPath) as! newCookCVC
            let widthCVC = self.cookCollectionView.layer.frame.size.width
            cell.layer.frame.size.height = 80
            cell.layer.frame.size.width = widthCVC
            return cell
        }
    }
}

extension HomePageVC : UISearchBarDelegate {
    
}
