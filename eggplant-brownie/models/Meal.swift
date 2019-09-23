import Foundation

class Meal {
    let name:String
    let happiness:Int
    var items = Array<Item>()

    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for Item in items {
            total += Item.calories
        }
        return total
        
    }
    
    
    
}

