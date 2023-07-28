//
//  String.swift
//  CrypList
//
//  Created by Riley Brookins on 7/27/23.
//

import Foundation


extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
