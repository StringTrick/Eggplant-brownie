import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Conexão com os TextField do Storyboard
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    //Integrando MealsTableController
    var delegate : AddAMealDelegate?
    //criando variável destinada a Position
    var selected = Array<Item>()
    
    //Adicionando valores a funcao Add a tabela
    var items = [
        Item(name: "Arroz", calories: 10 ),
        Item(name: "Feijao", calories: 20),
    ]
    //função para criar o ONCLICK das celulas
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
        if(cell.accessoryType ==
            UITableViewCell.AccessoryType.none) {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            let item = items[indexPath.row]
            selected.append(item)
        } else {
            cell.accessoryType = UITableViewCell.AccessoryType.none
            let item = items[indexPath.row]
            if let position = selected.index(of: item){
            selected.remove(at: position)
        }
      }
    }
  }
    //Definindo número de linhas para a tabela do storyboard
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    //Definindo Celulas para a tabela do Storyboard
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell }
    
        @IBAction  func add(){
        if (nameField == nil || happinessField == nil) {
            return
        }
        let name:String = nameField!.text!
        
        if let happiness = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness, items: selected)
            print("eaten \(meal.name) eith happiness \(meal.happiness) with \(meal.items)!")
            //Boas práticas para desviar erros
            if (delegate == nil){
                return
            }
            delegate!.add(meal)
            //Removendo tela adicional da pilha do navegador ao adicionar nova celula
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
        }
    }
}
