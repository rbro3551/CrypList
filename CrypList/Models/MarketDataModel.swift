//
//  MarketDataModel.swift
//  CrypList
//
//  Created by Riley Brookins on 7/23/23.
//

import Foundation

// JSON data:
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON response:
 {
   "data": {
     "active_cryptocurrencies": 10017,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 778,
     "total_market_cap": {
       "btc": 41501904.25062519,
       "eth": 661004854.244624,
       "ltc": 13460757017.275188,
       "bch": 4994955461.114685,
       "bnb": 5144793366.606344,
       "eos": 1592568122231.497,
       "xrp": 1692061106199.3752,
       "xlm": 7937405072938.293,
       "link": 158205599359.91025,
       "dot": 230747275666.225,
       "yfi": 185245591.87061298,
       "usd": 1244722038403.4905,
       "aed": 4571739574852.195,
       "ars": 334228141343898.75,
       "aud": 1848785643640.703,
       "bdt": 135021430984398.95,
       "bhd": 468930357137.9384,
       "bmd": 1244722038403.4905,
       "brl": 5945266694511.685,
       "cad": 1645507598104.9524,
       "chf": 1077779918612.8158,
       "clp": 1016294720156746.6,
       "cny": 8946813067636.613,
       "czk": 26888535262473.727,
       "dkk": 8332338607270.18,
       "eur": 1118798488666.3618,
       "gbp": 968078831202.1981,
       "hkd": 9730483839405.25,
       "huf": 424547027086294.56,
       "idr": 18724789276417164,
       "ils": 4505597535175.483,
       "inr": 102072248273341.67,
       "jpy": 176431258250445.06,
       "krw": 1601521610711852,
       "kwd": 382053737745.5289,
       "lkr": 408340467328543.06,
       "mmk": 2612317838478942,
       "mxn": 21154891230043.25,
       "myr": 5677177217158.323,
       "ngn": 985825146973672.4,
       "nok": 12558030518781.746,
       "nzd": 2016267972796.047,
       "php": 68123638406545.2,
       "pkr": 356699622373398.75,
       "pln": 4989738395622.732,
       "rub": 112644528914265.14,
       "sar": 4666057142590.153,
       "sek": 12940628200058.049,
       "sgd": 1656275688459.182,
       "thb": 42834568473975.87,
       "try": 33522363517799.664,
       "twd": 39005232156430.99,
       "uah": 45716549337535.64,
       "vef": 124634017705.34164,
       "vnd": 29456347038818590,
       "zar": 22353676801619.44,
       "xdr": 918405708815.6327,
       "xag": 50576877716.99159,
       "xau": 634422375.7538761,
       "bits": 41501904250625.195,
       "sats": 4150190425062519.5
     },
     "total_volume": {
       "btc": 1066272.4757364509,
       "eth": 16982625.138185307,
       "ltc": 345835569.93967587,
       "bch": 128331063.88451631,
       "bnb": 132180719.39629562,
       "eos": 40916473234.96363,
       "xrp": 43472660288.28995,
       "xlm": 203928872924.36667,
       "link": 4064639421.9927726,
       "dot": 5928389873.589008,
       "yfi": 4759354.526730352,
       "usd": 31979565117.719097,
       "aed": 117457744720.87088,
       "ars": 8587034117264.217,
       "aud": 47499248069.34814,
       "bdt": 3468988666731.952,
       "bhd": 12047821464.62389,
       "bmd": 31979565117.719097,
       "brl": 152746587216.53583,
       "cad": 42276601330.84321,
       "chf": 27690465844.13065,
       "clp": 26110779900493.203,
       "cny": 229862718153.14145,
       "czk": 690823844855.5724,
       "dkk": 214075558118.86743,
       "eur": 28744320433.019897,
       "gbp": 24872010831.61064,
       "hkd": 249996892453.43158,
       "huf": 10907519011757.975,
       "idr": 481079790913640,
       "ils": 115758414589.64482,
       "inr": 2622453856891.691,
       "jpy": 4532895488263.415,
       "krw": 41146507458713.305,
       "kwd": 9815775737.66758,
       "lkr": 10491137910502.648,
       "mmk": 67116019357195.516,
       "mxn": 543514295382.09076,
       "myr": 145858796501.9169,
       "ngn": 25327951550344.42,
       "nok": 322642599982.231,
       "nzd": 51802226474.19774,
       "php": 1750241630872.3347,
       "pkr": 9164374413894.791,
       "pln": 128197026340.00774,
       "rub": 2894078305377.2856,
       "sar": 119880964288.1002,
       "sek": 332472350789.85486,
       "sgd": 42553256548.67662,
       "thb": 1100511463233.901,
       "try": 861261047801.7542,
       "twd": 1002127642311.4049,
       "uah": 1174555701104.4236,
       "vef": 3202113855.237217,
       "vnd": 756796408510822.2,
       "zar": 574313654649.14,
       "xdr": 23595802326.457893,
       "xag": 1299427907.9978354,
       "xau": 16299664.544850275,
       "bits": 1066272475736.4509,
       "sats": 106627247573645.1
     },
     "market_cap_percentage": {
       "btc": 46.834747347062255,
       "eth": 18.18394685879513,
       "usdt": 6.730656038868857,
       "xrp": 3.104787624694446,
       "bnb": 3.03012579548527,
       "usdc": 2.159649514763135,
       "steth": 1.181396940506373,
       "ada": 0.888517524054654,
       "doge": 0.8081346464118159,
       "sol": 0.7989022625745311
     },
     "market_cap_change_percentage_24h_usd": 0.2037954929606853,
     "updated_at": 1690150940
   }
 }
 
 
 */

struct GlobalData: Codable {
    let data: MarketData?
}

struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double?
    
    enum CodingKeys: String, CodingKey {
            case totalMarketCap = "total_market_cap"
            case totalVolume = "total_volume"
            case marketCapPercentage = "market_cap_percentage"
            case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }

}
