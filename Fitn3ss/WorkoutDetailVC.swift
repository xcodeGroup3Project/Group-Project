import UIKit
import CoreData

class WorkoutDetailVC: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    
    @IBOutlet weak var caloriesTF: UITextField!
    
    
    @IBOutlet weak var timeTF: UITextField!
    
    
    var selectedWorkout: Workout? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        dateTF.inputView = datePicker
        dateTF.text = formatDate(date: Date())
        
        if(selectedWorkout != nil){
            dateTF.text = selectedWorkout?.date
            timeTF.text = selectedWorkout?.time
            nameTF.text = selectedWorkout?.name
            caloriesTF.text = selectedWorkout?.caloriesBurned
        }
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        dateTF.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
    }
    
    @IBAction func save(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedWorkout == nil){
            let entity = NSEntityDescription.entity(forEntityName: "Workout", in: context)
            
            let newWorkout = Workout(entity: entity!, insertInto: context)
            newWorkout.id = sleepList.count as NSNumber
            newWorkout.date = dateTF.text
            newWorkout.time = timeTF.text
            newWorkout.name = nameTF.text
            newWorkout.caloriesBurned = caloriesTF.text
            do{
                try context.save()
                workoutList.append(newWorkout)
                navigationController?.popViewController(animated: true)
            }catch{
                print("Error")
            }
        }else{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
            do{
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let workout = result as! Workout
                    if(workout == selectedWorkout){
                        workout.date = dateTF.text
                        workout.time = timeTF.text
                        workout.name = nameTF.text
                        workout.caloriesBurned = caloriesTF.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }catch{
                print("Error on Fetch")
            }
        }
        
        
    }
    

    
}

