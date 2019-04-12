//
//  SelectionTableViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit


protocol SelectionDelegate: class {
    func didSelectItem(atRow row: Int, with identifier: String)
}



class SelectionTableViewController: UITableViewController {
    public var selections: [String]!
    public var identifier = ""
    
    public weak var delegate: SelectionDelegate?
    
    
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selections.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell.textLabel?.text = selections[indexPath.row]

        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectItem(atRow: indexPath.row, with: identifier)
    }
}
