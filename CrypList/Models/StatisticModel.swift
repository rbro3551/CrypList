//
//  StatisticModel.swift
//  CrypList
//
//  Created by Riley Brookins on 7/22/23.
//

import Foundation


struct Statistic: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
        
    }
}
