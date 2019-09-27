import Foundation

//Definindo classe Equal para poder igualar valores
class Item: Equatable {
    
    let name: String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}
//Definindo condição do Equal FORA DA CLASSE
func ==(first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
    
}
