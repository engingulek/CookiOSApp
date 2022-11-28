//
//  CookPageController.swift
//  CookApp
//
//  Created by engin gülek on 31.10.2022.
//


import UIKit

class CookPageController : UIViewController {
    @IBOutlet weak var cookCategoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var cooksTableView: UITableView!
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
        
        /// cookCategoriesCV connect cell and delegate dataSource
        cookCategoriesCollectionView.register(UINib(nibName: "CategoriesCVC", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        cookCategoriesCollectionView.delegate = self
        cookCategoriesCollectionView.dataSource = self
        
        /// cooksTV connect cell and delegate dataSource
        cooksTableView.register(UINib(nibName: "CookTVC", bundle: nil), forCellReuseIdentifier: "cookCell")
        cooksTableView.delegate = self
        cooksTableView.dataSource = self
        setupUI()
    }
    
    private func setupUI(){
        
        /// Category Collection View Design
        let designCategoriesCVC : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let widthCat = self.cookCategoriesCollectionView.layer.frame.size.width
        let heightCat = self.cookCategoriesCollectionView.layer.frame.size.height
        designCategoriesCVC.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10)
        designCategoriesCVC.itemSize = CGSize(width: widthCat/3, height: heightCat/1.5)
        designCategoriesCVC.minimumLineSpacing = 20
        designCategoriesCVC.minimumInteritemSpacing = 40
       designCategoriesCVC.scrollDirection = .horizontal
        self.cookCategoriesCollectionView.collectionViewLayout = designCategoriesCVC
        
        
        
    }
}

//Mark: -Delegate and Datasource

/// Categories
extension CookPageController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CategoriesCVC = cookCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCVC
       // let widthCVC = self.cookCategoriesCollectionView.layer.frame.size.width
        cell.layer.cornerRadius = 20
        cell.layer.backgroundColor = UIColor.red.cgColor
        cell.categoryLabel.textColor = UIColor.white
        
        
        return cell
    }
    
    
}

/// Cooks
extension CookPageController : UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CookTVC = cooksTableView.dequeueReusableCell(withIdentifier: "cookCell",for:indexPath)
        as! CookTVC
        let height = self.cooksTableView.layer.frame.size.height
        self.cooksTableView.rowHeight = height/5
        return cell
    }
    
    
    

    
    
    
}
