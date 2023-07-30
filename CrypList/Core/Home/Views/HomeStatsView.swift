//
//  HomeStatsView.swift
//  CrypList
//
//  Created by Riley Brookins on 7/22/23.
//

import SwiftUI

struct HomeStatsView: View {
    var width: CGFloat
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: width / 3)
            }
        }
        .frame(width: width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            HomeStatsView(width: geo.size.width, showPortfolio: .constant(false))
                .environmentObject(dev.homeVM)
        }
    }
}
