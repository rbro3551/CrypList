//
//  CoinDetailDataService.swift
//  CrypList
//
//  Created by Riley Brookins on 7/26/23.
//

import Foundation


import Foundation
import Combine


class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    let coin: Coin
    
    var coinDetailSubscription: AnyCancellable?
    
    init(coin: Coin) {
        self.coin = coin
        getCoinDetails()
        
    }
    
    func getCoinDetails() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}
