//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

//protocol CoinManagerDelegate{
//    func didUpdateCoin(_ coin: CoinModel)
//    func didFailWithError(_ error: Error)
//}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C444CF8B-6391-494F-82A4-A6B0702A83B8"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
//    let delegate:CoinManagerDelegate?
    
    func getCoinPrice(for currency: String){
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
                if let safeData = data{
                    let stringify = String(data: safeData, encoding: String.Encoding.utf8)!
                    print(stringify)
                    parseJSON(safeData)
                }
                
            }
            // 4. START TASK
            task.resume()
        }
    }
    
    func parseJSON(_ data:Data)->Double?{
        // STEP PARSING DATA (JSON)
        // 1. DEKLARASI JSON DECODER
        let decoder = JSONDecoder()
        do {
            // 2. START DECODE DATA USING TRY CATCH
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastRate = decodedData.rate
            // 3. RETURN VALUE
            print(lastRate)
            return lastRate
        } catch {
//            delegate?.didFailWithError(error)
            print("asdasf")
            return nil
        }
    }
}

