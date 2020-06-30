//
//  ViewerTableViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit


class ViewerTableViewController: UITableViewController {
    var dataSourceObj: Viewable?
    var dataSourceArr: [Viewable]?
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let obj = dataSourceObj {
            self.title = obj.cell.title
        }
        else if let obj = dataSourceArr?.first {
            self.title = obj.cell.title
        }
    }
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceObj?.cells.count ?? dataSourceArr?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContents = dataSourceObj?.cells[indexPath.row] ?? dataSourceArr?[indexPath.row].cell ?? CellContents(title: "", subtitle: "")
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContents.title
        cell.detailTextLabel?.text = cellContents.subtitle
        cell.accessoryType = cellContents.type != nil ? .disclosureIndicator : .none
        
        return cell
    }
    
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellContents = dataSourceObj?.cells[indexPath.row] ?? dataSourceArr?[indexPath.row].cell ?? CellContents(title: "", subtitle: "")
        
        guard let type = cellContents.type else {
            return
        }
        
        switch type {
//        case .link(let link):
//            break
//            Diablo3MbodelController.shared.getResource(from: link) { result in
//
//            }
        case .array(let viewables):
            let viewController = ViewerTableViewController()
            viewController.dataSourceArr = viewables
            self.navigationController?.pushViewController(viewController, animated: true)
        case .object(let viewable):
            let viewController = ViewerTableViewController()
            viewController.dataSourceObj = viewable
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let cellContents = dataSourceObj?.cells[indexPath.row] ?? dataSourceArr?[indexPath.row].cell ?? CellContents(title: "", subtitle: "")
        return cellContents.type != nil
    }
}
