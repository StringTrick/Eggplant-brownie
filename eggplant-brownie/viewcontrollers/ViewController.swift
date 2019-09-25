import UIKit

class ViewController: UIViewController {
    //Conexão com os TextField do Storyboard
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    //Integrando MealsTableController
    var mealsTable : MealsTableViewController?
    //Adicionando valores a funcao Add a tabela
    @IBAction func add() {
        // Boas práticas para desviar erros
        if (nameField == nil || happinessField == nil) {
            return
        }
        let name:String = nameField!.text!
        
        if let happiness = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            
            print("eaten \(meal.name) eith happiness \(meal.happiness)!")
            //Boas práticas para desviar erros
            if (mealsTable == nil){
                return
            }
            mealsTable!.add(meal: meal)
            //Removendo tela adicional da pilha do navegador ao adicionar nova celula
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
                
            }
        }
        
    }

}
