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
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
