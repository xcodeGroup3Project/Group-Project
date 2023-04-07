//
//  EntryViewController.swift
//  Fitn3ss
//
//  Created by var shmet on 4/1/23.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var entry: UITextField!
    @IBOutlet var meal: UITextView!
    
    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        /*let button = UIButton(type:.system)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)*/
        
        
        /*let action = UIAction(title: "Save") { _ in
            if let text = self.entry.text, !text.isEmpty, !self.meal.text.isEmpty {
                self.completion?(text, self.meal.text)
            }
        }
        let button = UIButton(type: .system, primaryAction: action)
        */
        
    }
    @objc func didTapSave() {
        if let text = entry.text, !text.isEmpty, !meal.text.isEmpty {
            completion?(text, meal.text)
        }
    }
}
