//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Patrick Batista de Arruda on 20/09/19.
//  Copyright © 2019 Patrick Batista de Arruda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    
    
    @IBAction func add () {
        let name = nameField.text
        let happiness = happinessField.text
        
        print("Eaten an \(name!) with happiness \(happiness!)")
    }
    


}
