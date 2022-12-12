//
//  CookPageController.swift
//  CookApp
//
//  Created by engin gülek on 31.10.2022.
//


import UIKit
import Kingfisher
class CookPageController : UIViewController {
    @IBOutlet weak var cookCategoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var cooksTableView: UITableView!
    var cookPageObject : ViewToPresenterCookPageProtocol?
    var categories = [Category]()
    var cooks = [Cook]()
    var lastIndexSelection:IndexPath = [1,0]
    override func viewDidLoad() {
        CookPageRouter.createModel(ref: self)
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
        
        cookPageObject?.getCategoriesAction()
        cookPageObject?.getCooksAction()
        self.lastIndexSelection = [0,0]
       
        
        
        
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

// MARK: - VIPER->Protocols

/// Presenter to view protocol
extension CookPageController:PresenterToViewCookPageProtol{
   
    
    func toViewCooks(cookList: Array<Cook>) {
        self.cooks = cookList
        DispatchQueue.main.async {
            self.cooksTableView.reloadData()
        }
    
        
    }
    
    func toViewCategories(categoryList: Array<Category>) {
        self.categories = categoryList
        let allCooks = Category(_id: "0",categoryName: "All")
        self.categories.insert(allCooks, at: 0)
        DispatchQueue.main.async {
            self.cookCategoriesCollectionView.reloadData()
        }
        
        
    }
}


//MARK: - Delegate and Datasource

/// Categories
extension CookPageController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cookCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCVC
       // let widthCVC = self.cookCategoriesCollectionView.layer.frame.size.width
        cell.layer.cornerRadius = 20
        cell.categoryLabel.text = self.categories[indexPath.row].categoryName
        cell.layer.backgroundColor = UIColor.red.cgColor
        cell.categoryLabel.textColor = UIColor.white
        
        if lastIndexSelection == [0,0] && indexPath.row == 0 {
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        // Change backround color when selected category
        if self.lastIndexSelection != indexPath {
            let cell = self.cookCategoriesCollectionView.cellForItem(at: indexPath) as! CategoriesCVC
            cell.backgroundColor = UIColor.blue
            let cellSelection = self.cookCategoriesCollectionView.cellForItem(at: self.lastIndexSelection) as? CategoriesCVC
            cellSelection?.backgroundColor = UIColor.red
            self.lastIndexSelection = indexPath
            let category = categories[indexPath.row]
            cookPageObject?.getCooksAction(categoryId:category._id! )
        }
    }
}

/// Cooks
extension CookPageController : UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cooks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CookTVC = cooksTableView.dequeueReusableCell(withIdentifier: "cookCell",for:indexPath)
        as! CookTVC
        let height = self.cooksTableView.layer.frame.size.height
        self.cooksTableView.rowHeight = height/5
        let cook = cooks[indexPath.row]
        cell.name.text = cook.name
        let url = URL(string: cook.imageURL!)
        cell.cookImage.kf.setImage(with: url)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cook = cooks[indexPath.row]
        performSegue(withIdentifier: "cookPageToDetailPage", sender: cook)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cookPageToDetailPage" {
            if let cook = sender as? Cook{
                let toDetailPage = segue.destination as? DetailPageController
                toDetailPage?.cook = cook
            }
        }else{
            return
        }
    }
}
