import Foundation

class Meal {
    var name:String
    var happiness:Int
    var items = Array<Item>[]

    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    
}

