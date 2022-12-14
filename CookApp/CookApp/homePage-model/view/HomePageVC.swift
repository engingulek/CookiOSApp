//
//  HomePageVC.swift
//  CookApp
//
//  Created by engin gülek on 26.10.2022.
//

import UIKit
import Kingfisher
class HomePageVC: UIViewController{
   
    @IBOutlet weak var viewToSearchBar: UIView!
    @IBOutlet weak var trendsCookCollectionView: UICollectionView!
    @IBOutlet weak var cookCollectionView: UICollectionView!
    var homePageObject : ViewToPresenterHomePageProtocol?
    var trendList = [Cook]()
    var newList = [Cook]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomePageRouter.createView(view: self)
       
    
        trendsCookCollectionView.delegate = self
        trendsCookCollectionView.dataSource = self
        trendsCookCollectionView.register(UINib(nibName: "TrendsCVC", bundle: nil),forCellWithReuseIdentifier: "cookCell")
        
        cookCollectionView.delegate = self
        cookCollectionView.dataSource = self
        cookCollectionView.register(UINib(nibName: "newCookCVC", bundle: nil), forCellWithReuseIdentifier: "newCookCell")
        setupUI()
        homePageObject?.getCookAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        homePageObject?.getCookAction()
    }
    /// setupDesign
    private func setupUI(){
        
        self.viewToSearchBar.backgroundColor = UIColor.init(named: "searchBarViewColor")
       
        let designTCV : UICollectionViewFlowLayout  = UICollectionViewFlowLayout()
        let widthTCV  = self.trendsCookCollectionView.layer.frame.size.width
        let heightTCV  = self.trendsCookCollectionView.layer.frame.size.height
        designTCV.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        designTCV.itemSize = CGSize(width: widthTCV/1.2, height: heightTCV/1.2)
        designTCV.minimumLineSpacing = 10
        designTCV.minimumInteritemSpacing = 5
        designTCV.scrollDirection = .horizontal
        self.trendsCookCollectionView.collectionViewLayout = designTCV
        
        
        
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
/// get trendCook and newCook 
extension  HomePageVC : PresenterToViewHomePageProtocol {
    func toTrendsCookView(trendList: Array<Cook>) {
        self.trendList = trendList
        DispatchQueue.main.async {
            self.trendsCookCollectionView.reloadData()
        }
    }
    
    func toNewCookView(newCookList: Array<Cook>) {
        self.newList = newCookList
        DispatchQueue.main.async {
            self.cookCollectionView.reloadData()
        }
    }
}

//MARK: - CollectionView

/// Delegate
extension HomePageVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.trendsCookCollectionView {
            return self.trendList.count
        }else{
            return self.newList.count
        }
    }
}

///Data Source
extension HomePageVC :  UICollectionViewDataSource {
  
    /// trendsCollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.trendsCookCollectionView {
            let cell : TrendsCVC = trendsCookCollectionView.dequeueReusableCell(withReuseIdentifier: "cookCell", for: indexPath) as! TrendsCVC
            cell.layer.cornerRadius = 20
            let trendCook = trendList[indexPath.row]
            let url = URL(string: trendCook.imageURL!)
            cell.cookImageView.kf.setImage(with: url)
            cell.cookNameLabel.text = trendCook.name
            if let rating = trendCook.rating,let minute = trendCook.minute {
                cell.cookRatingLabel.text = String(rating)
                cell.cookMinunteLabel.text = String(minute)
            }
            
            cell.cookCategoryLabel.text = trendCook.category?.categoryName
            return cell
            
            /// newCook collectionview
        }else{
            
            let cell : newCookCVC = cookCollectionView.dequeueReusableCell(withReuseIdentifier: "newCookCell", for: indexPath) as! newCookCVC
            let widthCVC = self.cookCollectionView.layer.frame.size.width
            cell.layer.frame.size.height = 80
            cell.layer.frame.size.width = widthCVC
            let newCook = newList[indexPath.row]
            let url = URL(string: (newCook.imageURL!))
            cell.foodImageView.kf.setImage(with: url)
            cell.name.text = newCook.name
            return cell
        }
    }
    
    /// didSelect
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCook : Cook?
        if collectionView == self.trendsCookCollectionView {
            selectedCook = trendList[indexPath.row]
            
        }else if collectionView == self.cookCollectionView {
            selectedCook = newList[indexPath.row]
        }else{
            return
        }
        performSegue(withIdentifier: "homePageToDetailPage", sender: selectedCook)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homePageToDetailPage" {
            if let cook = sender as? Cook {
                let toDetailPage = segue.destination as? DetailPageController
                toDetailPage?.cook = cook
            }
        }
    }
}


