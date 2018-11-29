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
    
    let dollarConverter = CurrencyConverter(conversionRate: 1.1449)
    let poundConverter = CurrencyConverter(conversionRate: 0.8905)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poundRate.text = "\(poundConverter.conversionRate)";
        dollarRate.text = "\(dollarConverter.conversionRate)";
    }
    
    @IBAction func dollarAmountChanged(_ sender: Any) {
        let euroValue = dollarConverter.convertToEuro(amount: 5.0)
        euroAmount.text = "\(euroValue)"
        poundAmount.text = "\(poundConverter.convertFromEuro(amount: euroValue))"
    }
    @IBAction func euroAmountChanged(_ sender: Any) {
        let euroValue = dollarConverter.convertFromEuro(amount: 5.0)
        dollarAmount.text = "\(euroValue)"
        poundAmount.text = "\(poundConverter.convertFromEuro(amount: euroValue))"
    }
    @IBAction func poundAmountChanged(_ sender: Any) {
        let euroValue = poundConverter.convertToEuro(amount: 5.0)
        euroAmount.text = "\(euroValue)"
        dollarAmount.text = "\(dollarConverter.convertFromEuro(amount: euroValue))"
    }
    
    @IBAction func dollarRateChanged(_ sender: Any) {
        print(doublify(text: dollarRate.text))
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


