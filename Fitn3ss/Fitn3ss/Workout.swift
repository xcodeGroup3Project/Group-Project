import CoreData

@objc(Workout)
class Workout: NSManagedObject{
    @NSManaged var id: NSNumber!
    @NSManaged var date: String!
    @NSManaged var name: String!
    @NSManaged var time: String!
    @NSManaged var caloriesBurned: String!
}
