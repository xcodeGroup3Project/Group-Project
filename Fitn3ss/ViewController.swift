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
    
    
    @IBOutlet var titlelabel: UILabel!
    
    
    
    
    var models: [(title: String, calories_count: String)] = [ ]
    var modelsLunch: [(title: String, calories_count: String)] = [ ]
    var modelsDinner: [(title: String, calories_count: String)] = [ ]
    
    @IBAction func newMeal(){
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "breakfast") as? EntryViewController else {
            return
        }
        vc.title = "New Meal"
        vc.completion = {MealName, calories in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: MealName, calories_count: calories))
            self.BreakfastTableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    //------------------------------------------------------------------------------------------------------------------
    @IBAction func newLunch(){
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "lunch") as? EntryViewController else {
            return
        }
        vc.title = "New Meal"
        vc.completion = {MealName, calories in
            self.navigationController?.popToRootViewController(animated: true)
            self.modelsLunch.append((title: MealName, calories_count: calories))
            self.LunchTableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    //------------------------------------------------------------------------------------------------------------------
    @IBAction func newDinner(){
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "dinner") as? EntryViewController else {
            return
        }
        vc.title = "New Meal"
        vc.completion = {MealName, calories in
            self.navigationController?.popToRootViewController(animated: true)
            self.modelsDinner.append((title: MealName, calories_count: calories))
            self.DinnerTableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    //------------------------------------------------------------------------------------------------------------------

    
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
            return models.count
        }
        else if tableView.tag == 1 {
            return modelsLunch.count
        }
        else {
            return modelsDinner.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //show the meal controller
        
        print("selected row")
        /*guard let vc = storyboard?.instantiateViewController(withIdentifier: "meal") as? MealViewController else {
                return
        }
        vc.title = "Meal"
        navigationController?.pushViewController(vc, animated: true)*/
            
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Breakfast", for: indexPath)
            cell.textLabel?.text = models[indexPath.row].title
            cell.detailTextLabel?.text = models[indexPath.row].calories_count
            return cell
        }
        else if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Lunch", for: indexPath)
            cell.textLabel?.text = modelsLunch[indexPath.row].title
            cell.detailTextLabel?.text = modelsLunch[indexPath.row].calories_count
            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Dinner", for: indexPath)
            cell.textLabel?.text = modelsDinner[indexPath.row].title
            cell.detailTextLabel?.text = modelsDinner[indexPath.row].calories_count
            return cell
        }
        
    }
    
    
}
