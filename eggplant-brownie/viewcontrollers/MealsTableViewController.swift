import UIKit

class MealsTableViewController : UITableViewController, AddAMealDelegate {
    //Declaração de array Meals
    var meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Cuzcuz", happiness: 1),
                 Meal(name: "Bife a cavalo", happiness: 4)]
    //Função adicionar refeição a tabela
    func add (_ meal:Meal) { // Adicionando underline para acionar sem especificar
        meals.append(meal)
        tableView.reloadData()
    }
    //Função prepare para seguir o viewcontroller durante a navegação
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal") { // adicionando identificador como boa prática
        let view = segue.destination as! ViewController
        view.delegate = self
        }
    }
    //Declaração de linhas da tabela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    //Declaração de celulas por linha
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }

    @objc func showDetails(recognizer : UILongPressGestureRecognizer) {
        if (recognizer.state == UIGestureRecognizer.State.began) {
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
            
                RemoveMealController(controller: self).show(meal, handler: { action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        }
    }
}
