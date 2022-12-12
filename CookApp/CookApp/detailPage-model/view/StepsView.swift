//
//  StepsView.swift
//  CookApp
//
//  Created by engin gülek on 12.12.2022.
//

import UIKit

class StepsView: UIViewController {
    @IBOutlet weak var stepsTableViewController: UITableView!
    var steps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepsTableViewController.delegate = self
        stepsTableViewController.dataSource = self
        print("Denme \(steps)")
        
    }

}

extension StepsView:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stepsTableViewController.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath)
        let step = "\(indexPath.row + 1):  \(steps[indexPath.row])"
        cell.textLabel?.text = step
        cell.textLabel?.numberOfLines = 3
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Steps"
    }
    
    
    
    
}
