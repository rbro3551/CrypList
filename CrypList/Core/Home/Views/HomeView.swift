//
//  HomeView.swift
//  CrypList
//
//  Created by Riley Brookins on 7/17/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet\
    @State private var showSettingsView: Bool = false
    @State private var showDetailView: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // background layer
                Color.theme.background
                    .ignoresSafeArea()
                    .sheet(isPresented: $showPortfolioView) {
                        PortfolioView()
                            .environmentObject(vm)
                    }
                
                // content layer
                
                VStack {
                    homeHeader
                    
                    HomeStatsView(width: geo.size.width, showPortfolio: $showPortfolio)
                    
                    SearchBarView(searchText: $vm.searchText)
                    
                    HStack {
                        HStack {
                            Text("Coin")
                            Image(systemName: "chevron.down")
                                .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0: 0.0)
                                .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
                        }
                        .onTapGesture {
                            withAnimation(.default) {
                                vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                            }
                        
                        }
                        Spacer()
                        if showPortfolio {
                            HStack {
                                Text("Holdings")
                                Image(systemName: "chevron.down")
                                    .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0: 0.0)
                                    .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))


                            }
                            .onTapGesture {
                                withAnimation(.default) {
                                    vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                                }
                            }
                        }
                        HStack(spacing: 4) {
                            Text("Price")
                            Image(systemName: "chevron.down")
                                .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0: 0.0)
                                .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))


                                
                        }
                        .onTapGesture {
                            withAnimation(.default) {
                                vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                            }
                        }
                        .frame(width: geo.size.width / 3.5, alignment: .trailing)
                        
                        Button {
                            withAnimation(.linear(duration: 2.0)) {
                                vm.reloadData()
                            }
                        } label: {
                            Image(systemName: "goforward")
                        }
                        .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
                    }
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                    .padding(.horizontal)
                    
                    
                    if !showPortfolio {
                        allCoinsList
                            .transition(.move(edge: .leading))
                    }
                    if showPortfolio {
                        ZStack(alignment: .top) {
                            if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty {
                                Text("Click the + button to get started.")
                                    .font(.callout)
                                    .foregroundColor(Color.theme.accent)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                    .padding(50)
                            } else {
                                portfolioCoinsList
                            }
                        }
                        .transition(.move(edge: .trailing))
                    }
                    
                    
                    Spacer(minLength: 0)
                }
                .sheet(isPresented: $showSettingsView) {
                    SettingsView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden)
            
        }
        .environmentObject(dev.homeVM)
    }
}


extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    } else {
                        showSettingsView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none, value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    HapticManager.impact()
                    withAnimation(.spring()) {
                        showPortfolio.toggle()

                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .background (
                        NavigationLink("") {
                            LazyView { DetailView(coin: coin) }
                        }
                        .opacity(0)
                    )
                    .listRowBackground(Color.theme.background)
            }

        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .background (
                        NavigationLink("") {
                            LazyView { DetailView(coin: coin) }
                        }
                        .opacity(0)
                    )
                    .listRowBackground(Color.theme.background)
            }
        }
        .listStyle(.plain)
    }
    
}
