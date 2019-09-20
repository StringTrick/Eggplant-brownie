import UIKit

var str = "Hello, playground"


func add(name:String, calories:Double) {
    print("adding \(name) with \(calories)")
}

add(name: "Brownie", calories: 30.5)
add(name: "Brownie", calories: 30.5)
add(name: "Eggplant", calories: 50.5)

let calories = [10,20,30,40]

for i in 0...3 {
    print("Calorias são: \(calories[i])")
}

