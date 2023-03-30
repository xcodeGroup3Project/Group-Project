import UIKit
import CoreData

var workoutList = [Workout]()

class WorkoutTableView: UITableViewController{
    
    var firstLoad = true
    
    override func viewDidLoad() {
        if(firstLoad){
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
            do{
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let workout = result as! Workout
                    workoutList.append(workout)
                }
            }catch{
                print("Error on Fetch")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let workoutCell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath) as! WorkoutCell
        
        let thisWorkout: Workout!
        thisWorkout = workoutList[indexPath.row]
        
        workoutCell.dateLabel.text = thisWorkout.date
        workoutCell.timeLabel.text = thisWorkout.time
        workoutCell.caloriesBurnedLabel.text = thisWorkout.caloriesBurned
        workoutCell.nameLabel.text = thisWorkout.name
        
        return workoutCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutList.count
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editWorkout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editWorkout"){
            let indexPath = tableView.indexPathForSelectedRow
            let workoutDetail = segue.destination as? WorkoutDetailVC
            let selectedWorkout: Workout!
            selectedWorkout = workoutList[indexPath!.row]
            workoutDetail!.selectedWorkout = selectedWorkout
            
            tableView.deselectRow(at: indexPath!, animated: true)
        }
    }
    
}
