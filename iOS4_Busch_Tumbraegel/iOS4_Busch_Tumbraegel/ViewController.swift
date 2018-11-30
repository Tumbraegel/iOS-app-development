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
        let euroValue = dollarConverter.convertToEuro(amount: doublify(text: dollarAmount.text))
        set(currencyField: euroAmount, newValue: euroValue)
        set(currencyField: poundAmount, newValue: poundConverter.convertFromEuro(amount: euroValue))
    }
    
    @IBAction func euroAmountChanged(_ sender: Any) {
        set(currencyField: dollarAmount, newValue: dollarConverter.convertFromEuro(amount: doublify(text: euroAmount.text)))
        set(currencyField: poundAmount, newValue: poundConverter.convertFromEuro(amount: doublify(text: euroAmount.text)))
    }
    
    @IBAction func poundAmountChanged(_ sender: Any) {
        let euroValue = poundConverter.convertToEuro(amount: doublify(text: poundAmount.text))
        set(currencyField: dollarAmount, newValue: dollarConverter.convertFromEuro(amount: euroValue))
        set(currencyField: euroAmount, newValue: euroValue)
    }
    
    @IBAction func dollarRateChanged(_ sender: Any) {
        
    }
    
    
    @IBAction func poundRateChanged(_ sender: Any) {

    }
    
    func set(currencyField: UITextField, newValue: Double){
        currencyField.text = shortenDoubleToString(inputValue: newValue)
    }
    
    func shortenDoubleToString(inputValue: Double) -> String {
        return String(format: "%.2lf", inputValue)
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
