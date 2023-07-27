//
//  LazyView.swift
//  CrypList
//
//  Created by Riley Brookins on 7/25/23.
//

import SwiftUI

struct LazyView<Content: View>: View {
    var content: () -> Content
    var body: some View {
        self.content()
    }
}

//struct LazyView_Previews: PreviewProvider {
//    static var previews: some View {
//        LazyView<DetailView>(content: DetailView(coin: .constant(dev.coin)))
//    }
//}
