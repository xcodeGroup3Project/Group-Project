//
//  ViewController.swift
//  Fitn3ss
//
//  Created by var shmet on 3/21/23.
//
//THIS IS FOR THE MEAL TRACKER
import UIKit

class ViewController: UIViewController {

    @IBOutlet var BreakfastTableView: UITableView!
    @IBOutlet var LunchTableView: UITableView!
    @IBOutlet var DinnerTableView: UITableView!
    @IBAction func newMeal(){
        
    }
    
    var models : [(title: String, calories: String)] = []
    let test_values1 = ["222","222","222"]
    let test_values2 = ["333","333","333"]
    let test_values3 = ["444","444","444"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BreakfastTableView.delegate = self
        BreakfastTableView.dataSource = self
        
        LunchTableView.delegate = self
        LunchTableView.dataSource = self
        
        DinnerTableView.delegate = self
        DinnerTableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return test_values1.count
        }
        else if tableView.tag == 1 {
            return test_values2.count
        }
        else {
            return test_values3.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //show the meal controller
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "meal") as? MealViewController else {
                return
        }
        vc.title = "Meal"
        navigationController?.pushViewController(vc, animated: true)
            
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Breakfast", for: indexPath)
            cell.textLabel?.text = test_values1[indexPath.row]
            return cell
        }
        else if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Lunch", for: indexPath)
            cell.textLabel?.text = test_values2[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Dinner", for: indexPath)
            cell.textLabel?.text = test_values3[indexPath.row]
            return cell
        }
    }
}
