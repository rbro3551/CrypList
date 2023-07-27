//
//  xMarkButton.swift
//  CrypList
//
//  Created by Riley Brookins on 7/23/23.
//

import SwiftUI

struct xMarkButton: View {
    
    
    var onDismiss: () -> Void
    
    var body: some View {
        Button {
            onDismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }
}

struct xMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        xMarkButton() {  }
    }
}
