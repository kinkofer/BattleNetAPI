//
//  FormViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit


protocol WSPattern {
    var callService: () -> Void { get }
    
    func getNumberOfRows() -> Int
    func tableView(_ tableView: UITableView, cellForIndexPath indexPath: IndexPath) -> UITableViewCell
    func getViewController<V>(for indexPath: IndexPath, onViewController vc: V) -> UIViewController where V: SelectionDelegate, V: TextInputDelegate
    
    func update(identifier: String, selectedRow row: Int)
    func update(identifier: String, textInput text: String)
}



struct WebServicePattern {
    private struct ReuseIdentifier {
        static let optionSelector = "optionSelector"
        static let textInput = "textInput"
    }
    
    
    class IndexWithRegion<U>: WSPattern {
        enum Field: String, CaseIterable {
            case region
        }
        
        let serviceCall: (APIRegion, @escaping (Result<U, HTTPError>) -> Void) -> Void
        var region: APIRegion {
            didSet {
                callService = {
                    self.serviceCall(self.region, self.completion)
                }
            }
        }
        let completion: (Result<U, HTTPError>) -> Void
        
        private(set) var callService: () -> Void
        
        
        init(serviceCall: @escaping (APIRegion, @escaping (Result<U, HTTPError>) -> Void) -> Void, region: APIRegion, completion: @escaping (Result<U, HTTPError>) -> Void) {
            self.serviceCall = serviceCall
            self.region = region
            self.completion = completion
            
            callService = {
                serviceCall(region, completion)
            }
        }
        
        
        
        // MARK: - Functions
        
        func update(identifier: String, selectedRow row: Int) {
            if identifier == Field.region.rawValue {
                self.region = APIRegion.allCases[row]
            }
        }
        
        func update(identifier: String, textInput text: String) {
            
        }
        
        
        
        // MARK - UITableViewDataSource
        
        func getNumberOfRows() -> Int {
            return 1
        }
        
        
        func tableView(_ tableView: UITableView, cellForIndexPath indexPath: IndexPath) -> UITableViewCell {
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.optionSelector)
            
            if cell == nil {
                cell = UITableViewCell(style: .value2, reuseIdentifier: ReuseIdentifier.optionSelector)
            }
            
            cell.textLabel?.text = "Region"
            cell.detailTextLabel?.text = region.displayName
            
            return cell
        }
        
        
        func getViewController<V>(for indexPath: IndexPath, onViewController vc: V) -> UIViewController where V: SelectionDelegate, V: TextInputDelegate {
            let viewController = SelectionTableViewController()
            viewController.selections = APIRegion.allCases.map { $0.displayName }
            viewController.identifier = Field.region.rawValue
            viewController.delegate = vc
            return viewController
        }
    }
    
    
    class ResourceWithIDAndRegion<U>: WSPattern {
        enum Field: String, CaseIterable {
            case id
            case region
        }
        
        let serviceCall: (Int, APIRegion, @escaping (Result<U, HTTPError>) -> Void) -> Void
        var id: Int {
            didSet {
                callService = {
                    print("serviceCall(\(self.id), \(self.region.displayName), completion)")
                    self.serviceCall(self.id, self.region, self.completion)
                }
            }
        }
        var region: APIRegion {
            didSet {
                callService = {
                    self.serviceCall(self.id, self.region, self.completion)
                }
            }
        }
        let completion: (Result<U, HTTPError>) -> Void
        
        private(set) var callService: () -> Void
        
        
        init(serviceCall: @escaping (Int, APIRegion, @escaping (Result<U, HTTPError>) -> Void) -> Void, id: Int, region: APIRegion, completion: @escaping (Result<U, HTTPError>) -> Void) {
            self.serviceCall = serviceCall
            self.id = id
            self.region = region
            self.completion = completion
            
            callService = {
                serviceCall(id, region, completion)
            }
        }
        
        
        
        // MARK: - Functions
        
        func update(identifier: String, selectedRow row: Int) {
            if identifier == Field.region.rawValue {
                self.region = APIRegion.allCases[row]
            }
        }
        
        func update(identifier: String, textInput text: String) {
            if identifier == Field.id.rawValue {
                guard let id = Int(text) else {
                    return
                }
                self.id = id
            }
        }
        
        
        
        // MARK - UITableViewDataSource
        
        func getNumberOfRows() -> Int {
            return 2
        }
        
        
        func tableView(_ tableView: UITableView, cellForIndexPath indexPath: IndexPath) -> UITableViewCell {
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.optionSelector)
            
            if cell == nil {
                cell = UITableViewCell(style: .value2, reuseIdentifier: ReuseIdentifier.optionSelector)
            }
            
            switch Field.allCases[indexPath.row] {
            case .id:
                cell.textLabel?.text = "ID"
                cell.detailTextLabel?.text = String(id)
            case .region:
                cell.textLabel?.text = "Region"
                cell.detailTextLabel?.text = region.displayName
            }
            
            return cell
        }
        
        
        func getViewController<V>(for indexPath: IndexPath, onViewController vc: V) -> UIViewController where V: SelectionDelegate, V: TextInputDelegate {
            switch Field.allCases[indexPath.row] {
            case .id:
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TextInputViewController") as! TextInputViewController
                viewController.identifier = Field.id.rawValue
                viewController.delegate = vc
                return viewController
            case .region:
                let viewController = SelectionTableViewController()
                viewController.selections = APIRegion.allCases.map { $0.displayName }
                viewController.identifier = Field.region.rawValue
                viewController.delegate = vc
                return viewController
            }
        }
    }
}



class FormViewController: UITableViewController {
    public var webServicePattern: WSPattern!
    
    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Go", style: .done, target: self, action: #selector(callWebService(sender:)))
    }
    
    
    
    // MARK: - Functions
    
    @objc func callWebService(sender: Any) {
        webServicePattern.callService()
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webServicePattern.getNumberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return webServicePattern.tableView(tableView, cellForIndexPath: indexPath)
    }
    
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = webServicePattern.getViewController(for: indexPath, onViewController: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}



extension FormViewController: SelectionDelegate {
    func didSelectItem(atRow row: Int, with identifier: String) {
        self.navigationController?.popViewController(animated: true)
        webServicePattern.update(identifier: identifier, selectedRow: row)
        tableView.reloadData()
    }
}


extension FormViewController: TextInputDelegate {
    func didUpdateText(_ text: String, with identifier: String) {
        self.navigationController?.popViewController(animated: true)
        webServicePattern.update(identifier: identifier, textInput: text)
        tableView.reloadData()
    }
}
