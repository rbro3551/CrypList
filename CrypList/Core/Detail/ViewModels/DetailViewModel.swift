//
//  DetailViewModel.swift
//  CrypList
//
//  Created by Riley Brookins on 7/26/23.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [Statistic] = []
    @Published var additionalStatistics: [Statistic] = []
    
    @Published var coin: Coin
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
        
    
    init(coin: Coin) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStats)
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics  = returnedArrays.additional
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStats(coinDetailModel: CoinDetailModel?, coinModel: Coin) -> (overview: [Statistic], additional: [Statistic]) {
        // overview
        let overviewArray = createOverviewArray(coinModel: coinModel)
        
        // additional
        let additionalArray = createAdditionalArray(coinModel: coinModel, coinDetailModel: coinDetailModel)

        
        return (overviewArray, additionalArray)
    }
    
    private func createOverviewArray(coinModel: Coin) -> [Statistic] {
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = Statistic(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = Statistic(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = Statistic(title: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = Statistic(title: "Volume", value: volume)
        
        let overviewArray: [Statistic] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        
        return overviewArray
    }
    
    private func createAdditionalArray(coinModel: Coin, coinDetailModel: CoinDetailModel?) -> [Statistic] {
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = Statistic(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = Statistic(title: "24h low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStat = Statistic(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = Statistic(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = Statistic(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStat = Statistic(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray: [Statistic] = [
            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
        ]
        
        return additionalArray
    }
}

