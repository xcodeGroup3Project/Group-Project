//
//  ViewController.swift
//  Fitn3ss
//
//  Created by var shmet on 3/21/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var FitnessTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FitnessTableView.delegate = self
        FitnessTableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped fitness cell")//check if tapped
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;//amount of rows that show
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FitnessTableView.dequeueReusableCell(withIdentifier: "MealID", for: indexPath)
        return cell
    }
}
//add a model for the labels

