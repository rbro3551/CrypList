//
//  UIApplication.swift
//  CrypList
//
//  Created by Riley Brookins on 7/21/23.
//

import Foundation
import SwiftUI


extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
