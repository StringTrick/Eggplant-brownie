import Foundation

class Meal {
    let name:String
    let happiness:Int
    var items:Array<Item>

    //Declarando inicializador incluindo um Array
    init(name:String, happiness:Int, items: Array<Item>=[]) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    //Função para somar calorias
    func allCalories() -> Double {
        var total = 0.0
        for Item in items {
            total += Item.calories
        }
        return total
    }
    
    func details() -> String{
        var message = "Happiness: \(happiness)"
        for Item in items{
            message += "\n \(Item.name) - Calories: \(Item.calories)"
        }
        return message
    }
    
    
}
