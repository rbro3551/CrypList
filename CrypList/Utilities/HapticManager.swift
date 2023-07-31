//
//  HapticManager.swift
//  CrypList
//
//  Created by Riley Brookins on 7/24/23.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let generator = UINotificationFeedbackGenerator()
    static let impGenerator = UIImpactFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
    static func impact() {
        impGenerator.impactOccurred(intensity: 1.0)
    }
    
}
