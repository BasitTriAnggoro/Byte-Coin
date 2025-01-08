//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C444CF8B-6391-494F-82A4-A6B0702A83B8"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String){
//        print(currency)
        fetchData(currency: currency)
    }
    
    func fetchData(currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        // 1. CREATE URL
        if let url = URL(string: urlString){
            // 2. CREATE URL SESSION
            let session = URLSession(configuration: .default)
            // 3. GIVE URL SESSION TASK
            let task = session.dataTask(with: url){(data,response,error) in
                var stringify = String(data: data!, encoding: String.Encoding.utf8) as String?
                print(stringify)
            }
            // 4. START TASK
            task.resume()
        }
    }
}

