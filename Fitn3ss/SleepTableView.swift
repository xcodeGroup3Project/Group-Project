import UIKit
import CoreData

var sleepList = [Sleep]()

class SleepTableView: UITableViewController{
    
    var firstLoad = true
    
    override func viewDidLoad() {
        if(firstLoad){
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Sleep")
            do{
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let sleep = result as! Sleep
                    sleepList.append(sleep)
                }
            }catch{
                print("Error on Fetch")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sleepCell = tableView.dequeueReusableCell(withIdentifier: "sleepCell", for: indexPath) as! SleepCell
        
        let thisSleep: Sleep!
        thisSleep = sleepList[indexPath.row]
        
        sleepCell.dateLabel.text = thisSleep.date
        sleepCell.timeLabel.text = thisSleep.time
        
        return sleepCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sleepList.count
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editSleep", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editSleep"){
            let indexPath = tableView.indexPathForSelectedRow
            let sleepDetail = segue.destination as? SleepDetailVC
            let selectedSleep: Sleep!
            selectedSleep = sleepList[indexPath!.row]
            sleepDetail!.selectedSleep = selectedSleep
            
            tableView.deselectRow(at: indexPath!, animated: true)
        }
    }
    
}
