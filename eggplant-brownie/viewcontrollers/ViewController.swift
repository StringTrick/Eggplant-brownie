import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addAnItemDelegate {
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
    
    @IBOutlet var tableView : UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show()
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector (showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func showNewItem () {
        let newItem = NewItemViewController(delegate: self)
        navigationController?.pushViewController(newItem, animated: true)
        
    }
    
    
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
                    } else {
                    Alert(controller: self).show()
                }
            }
        } else {
            Alert(controller: self).show()
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
        return cell
        
    }
    
    func convertToInt (_ text:String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    
    func getMealFromForm() -> Meal? {
        if let name = nameField?.text {
            if let happiness = convertToInt(happinessField?.text) {
                
                let meal = Meal(name: name, happiness: happiness, items: selected)
                
                print("eaten \(meal.name) eith happiness \(meal.happiness) with \(meal.items)!")
                
                return meal
                }
            }
        return nil
    }
        @IBAction  func add(){
            
            if let meal = getMealFromForm() {
                if let meals = delegate {
                    meals.add(meal)
            //Removendo tela adicional da pilha do navegador ao adicionar nova celula
                    if let navigation = navigationController {
                        navigation.popViewController(animated: true)
                    } else{
                        Alert(controller: self).show(message:"Unable to go back, but the meal was added.")
                    }
                    return
                }
            }
        Alert(controller: self).show()
    }
}
