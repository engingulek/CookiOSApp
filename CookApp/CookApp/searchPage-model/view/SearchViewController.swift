//
//  SearchViewController.swift
//  CookApp
//
//  Created by engin gülek on 9.12.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchHistoryTableView: UITableView!
    var resultSearchList = [String]()
    var cookResultList = [Cook]()
    let searchInfoDatabase = UserDefaults.standard
    var searchDidChangeTextState = false
    var searchPageObject:ViewToPresenterSearchPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchHistoryTableView.delegate = self
        searchHistoryTableView.dataSource = self
        searchBar.delegate = self
        SearchPageRouter.createView(view: self)
   
        // get resutlSearchList
        resultSearchList = searchInfoDatabase.array(forKey: "resultSearchList") as? [String] ?? [String]()
        
    }
    
    func addMemorySearchInfo(searchText:String){
        
        if !resultSearchList.contains(searchText) && searchText.count != 0 {
            resultSearchList.append(searchText)
        }
        searchInfoDatabase.set(resultSearchList, forKey: "resultSearchList")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        searchDidChangeTextState = false
        searchBar.text = ""
        searchHistoryTableView.reloadData()
    }
    
}

extension SearchViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Tableview will reload When search
        // add search cook cell
        
        if searchText.count == 0{
            resultSearchList = searchInfoDatabase.array(forKey: "resultSearchList") as? [String] ?? [String]()
            searchDidChangeTextState = false
            searchHistoryTableView.reloadData()
        }else{
            searchHistoryTableView.register(UINib(nibName: "SearchCookResultTVC", bundle: nil), forCellReuseIdentifier: "resultSearchCookCell")
            searchDidChangeTextState = true
            searchPageObject?.getCookAction(searchText: searchText)
        }
        // MARK: - get search list cook count
        /// resultSearchList = get databaseCount
    }
}

extension SearchViewController : PresenterToViewSearchPageProtocol {
    func toViewSearchCookList(searchCookList: Array<Cook>) {
        self.cookResultList = searchCookList
        DispatchQueue.main.async {
            self.searchHistoryTableView.reloadData()
        }
    }
    
    
}

extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchDidChangeTextState {
            return cookResultList.count
        }else{
            return resultSearchList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if searchDidChangeTextState {
        let cell = searchHistoryTableView.dequeueReusableCell(withIdentifier: "resultSearchCookCell",for: indexPath) as! SearchCookResultTVC
            let cook = cookResultList[indexPath.row]
            let height =  self.searchHistoryTableView.layer.frame.size.height
            self.searchHistoryTableView.rowHeight = height/6
            let url = URL(string: cook.imageURL!)
            cell.cookImageView.kf.setImage(with: url)
            cell.cookName?.text = cook.name
            return cell
            
        }else{
            let cell = searchHistoryTableView.dequeueReusableCell(withIdentifier: "historyCell")!
            cell.textLabel?.text = resultSearchList[indexPath.row]
            self.searchHistoryTableView.rowHeight = 40
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchDidChangeTextState {
            let cook  = cookResultList[indexPath.row]
            performSegue(withIdentifier: "searchPageToDetail", sender: cook)
        }else{
            var selectedSearch = resultSearchList[indexPath.row]
            print(selectedSearch)
            searchBar.text = selectedSearch
            searchHistoryTableView.register(UINib(nibName: "SearchCookResultTVC", bundle: nil), forCellReuseIdentifier: "resultSearchCookCell")
            
            searchDidChangeTextState = true
            searchPageObject?.getCookAction(searchText: selectedSearch)
            searchHistoryTableView.reloadData()
            
        }
        addMemorySearchInfo(searchText: searchBar.text!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchPageToDetail" {
            if let cook = sender as? Cook{
                let toDetailPage = segue.destination as? DetailPageController
                toDetailPage?.cook = cook
            }
        }else{
            return
        }
    }
    
    
}


