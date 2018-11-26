//
//  ViewController.swift
//  iOS4_Busch_Tumbraegel
//
//  Created by Josefine Busch on 26.11.18.
//  Copyright © 2018 Josefine Busch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var poundRate: UITextField!
    @IBOutlet weak var dollarRate: UITextField!
    @IBOutlet weak var dollarAmount: UITextField!
    @IBOutlet weak var euroAmount: UITextField!
    @IBOutlet weak var poundAmount: UITextField!
    
    var calculator = Calculator();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poundRate.text = "\(calculator.conversionRatePound)";
        dollarRate.text = "\(calculator.conversionRateDollar)";
    }
    
    
    @IBAction func dollarRateChanged(_ sender: Any) {
        
    }
    
    
    @IBAction func poundRateChanged(_ sender: Any) {

    }
    
    func doublify(text : String?) -> Double{
        if let input = text{
            if let double = Double(input){
                return double
            }
        }
        return 0.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


