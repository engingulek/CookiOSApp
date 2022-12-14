//
//  MyCooksLikeTVC.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import UIKit

class MyCooksLikeTVC: UITableViewController {
    var myCookLikeTVCObject : ViewToPresenterMyAccountProtocol?
    var myCoookList = [LikeCook]()
    override func viewDidLoad() {
        super.viewDidLoad()
        MyAccountRouter.myLikesTVC(tvc: self)
        print("ali \(myCoookList)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UINib(nibName: "SearchCookResultTVC", bundle: nil), forCellReuseIdentifier: "resultSearchCookCell")
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myCoookList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultSearchCookCell", for: indexPath) as! SearchCookResultTVC
        let cook = myCoookList[indexPath.row]
        let url = URL(string: (cook.cook?.imageURL!)!)
        cell.cookImageView.kf.setImage(with: url)
        cell.cookName.text = cook.cook?.name
        let height =  tableView.layer.frame.size.height
        self.tableView.rowHeight = height/6
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Likes"
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteId = myCoookList[indexPath.row]._id
            myCookLikeTVCObject?.deleteDataAction(deleteId: deleteId!)
            myCoookList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.dismiss(animated: true)
            tableView.reloadData()
            
        }
        
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
