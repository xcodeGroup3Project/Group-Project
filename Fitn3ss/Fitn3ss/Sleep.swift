import CoreData

@objc(Sleep)
class Sleep : NSManagedObject{
    @NSManaged var id: NSNumber!
    @NSManaged var date: String!
    @NSManaged var time: String!
}

