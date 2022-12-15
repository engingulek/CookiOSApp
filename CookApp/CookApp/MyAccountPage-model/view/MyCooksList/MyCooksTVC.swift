//
//  MyCooksTVC.swift
//  CookApp
//
//  Created by engin gülek on 15.12.2022.
//

import UIKit
import Kingfisher
class MyCooksTVC: UITableViewController {
 
    var myCoookList = [Cook]()
    var myCookTVCObject : ViewToPresenterMyAccountProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SearchCookResultTVC", bundle: nil), forCellReuseIdentifier: "resultSearchCookCell")
        
        MyAccountRouter.myCooksTVC(tvc: self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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
        let url = URL(string: cook.imageURL!)
        cell.cookImageView.kf.setImage(with: url)
        cell.cookName.text = cook.name
        let height =  tableView.layer.frame.size.height
        self.tableView.rowHeight = height/6

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "MyCooks"
    }
        
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteId = myCoookList[indexPath.row]._id
            myCookTVCObject?.deleteDataAction(deleteId: deleteId!)
            myCoookList.remove(at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
            self.dismiss(animated: true)
            tableView.reloadData()
            
            
        }
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
