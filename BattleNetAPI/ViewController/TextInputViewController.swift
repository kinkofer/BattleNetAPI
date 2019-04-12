//
//  TextInputViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit


protocol TextInputDelegate: class {
    func didUpdateText(_ text: String, with identifier: String)
}



class TextInputViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    public var identifier = ""
    
    public weak var delegate: TextInputDelegate?
    
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save(sender:)))
    }
    
    
    
    // MARK: - Functions
    
    @objc func save(sender: Any) {
        guard let text = textField.text,
            !text.isEmpty else {
                self.presentOkayAlert(title: "Invalid Text", message: "You have a valid value")
                return
        }
        delegate?.didUpdateText(text, with: identifier)
    }
}
