//
//  Currency.swift
//  iOS4_Busch_Tumbraegel
//
//  Created by Josefine Busch on 26.11.18.
//  Copyright © 2018 Josefine Busch. All rights reserved.
//

import Foundation

class CurrencyConverter{
    var conversionRate: Double
    
    init(conversionRate: Double) {
        self.conversionRate = conversionRate;
    }
    
    func convertToEuro(amount: Double) -> Double {
        print("\(amount) / \(conversionRate) = \(amount / conversionRate)")
        return amount / conversionRate;
    }
    
    func convertFromEuro(amount: Double) -> Double {
        return amount * conversionRate;
    }
}
