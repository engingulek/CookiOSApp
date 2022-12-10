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
    let searchInfoDatabase = UserDefaults.standard
    var searchDidChangeTextState = false
    override func viewDidLoad() {
        super.viewDidLoad()
        searchHistoryTableView.delegate = self
        searchHistoryTableView.dataSource = self
        searchBar.delegate = self
        
        
        // get resutlSearchList
        resultSearchList = searchInfoDatabase.array(forKey: "resultSearchList") as? [String] ?? [String]()
    }
    
    func addMemorySearchInfo(searchText:String){
        
        if !resultSearchList.contains(searchText) {
            resultSearchList.append(searchText)
        }
        searchInfoDatabase.set(resultSearchList, forKey: "resultSearchList")
    }
}

extension SearchViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Tableview will reload When search
        // add search cook cell
        searchHistoryTableView.register(UINib(nibName: "SearchCookResultTVC", bundle: nil), forCellReuseIdentifier: "resulltSearchCookCell")
        searchDidChangeTextState = true
        
        // MARK: - get search list cook count
        /// resultSearchList = get databaseCount
        
    
    }
}

extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchDidChangeTextState {
            let cell = searchHistoryTableView.dequeueReusableCell(withIdentifier: "resultSearchList",for: indexPath) as! SearchCookResultTVC
            return cell
            
        }else{
            let cell = searchHistoryTableView.dequeueReusableCell(withIdentifier: "historyCell")
            cell?.textLabel?.text = resultSearchList[indexPath.row]
            return cell!
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchDidChangeTextState {
            _ = resultSearchList[indexPath.row]
        }else{
            addMemorySearchInfo(searchText: searchBar.text!)
        }
        

        
        
    }
    
    
}


