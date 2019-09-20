import UIKit

var str = "Hello, playground"


func add(name:String, calories:Double) {
    print("adding \(name) with \(calories)")
}

add(name: "Brownie", calories: 30.5)
add(name: "Brownie", calories: 30.5)
add(name: "Eggplant", calories: 50.5)

let totalCalories = [50.5, 100, 300, 500, 450]
print(totalCalories)

for i in 0...3{
    print(i)
    print("calories are \(totalCalories[i])")
}

for i in 0...(totalCalories.count - 1) {
    print(totalCalories[i])
}

for calories in totalCalories {
    print(calories)
}

func allCalories(calories:Array<Double>) -> Double {
    var total:Double = 0
    for c in calories {
        total += c
    }
    return total
}
allCalories(calories: [10.5,100,300,500])


let brownie = Meal(name: "eggplant brownie",
                   happiness: 5)
print(brownie.name)

let item1 = Item(name: "brownie", calories: 115)
lei item2 = Item(name: "vegan cream", calories: 40)
brownie.items.append(item1)
brownie.items.append(item2)

print(brownie.allCalories())
