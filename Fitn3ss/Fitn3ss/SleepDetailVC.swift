import UIKit
import CoreData

class SleepDetailVC: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    
    
    @IBOutlet weak var timeTF: UITextField!
    
    var selectedSleep: Sleep? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        dateTF.inputView = datePicker
        dateTF.text = formatDate(date: Date())
        
        if(selectedSleep != nil){
            dateTF.text = selectedSleep?.date
            timeTF.text = selectedSleep?.time
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
        if(selectedSleep == nil){
            let entity = NSEntityDescription.entity(forEntityName: "Sleep", in: context)
            
            let newSleep = Sleep(entity: entity!, insertInto: context)
            newSleep.id = sleepList.count as NSNumber
            newSleep.date = dateTF.text
            newSleep.time = timeTF.text
            do{
                try context.save()
                sleepList.append(newSleep)
                navigationController?.popViewController(animated: true)
            }catch{
                print("Error")
            }
        }else{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Sleep")
            do{
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let sleep = result as! Sleep
                    if(sleep == selectedSleep){
                        sleep.date = dateTF.text
                        sleep.time = timeTF.text
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
