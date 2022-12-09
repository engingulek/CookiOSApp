//
//  AddCookView.swift
//  CookApp
//
//  Created by engin gülek on 9.12.2022.
//

import UIKit

class AddCookView: UIViewController {

    
    @IBOutlet weak var addedIngredientsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addedIngredientsTableView.delegate = self
        addedIngredientsTableView.dataSource = self
    }
}

extension AddCookView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addedIngredientsTableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "Test"
        return cell
    }
    
    
}
