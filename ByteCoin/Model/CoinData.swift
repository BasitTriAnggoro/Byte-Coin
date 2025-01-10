//
//  CoinData.swift
//  ByteCoin
//
//  Created by Basit Tri Anggoro on 09/01/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

//MARK: - API Data Structure/Format (Codable)
struct CoinData: Codable{
    let rate: Double
    let asset_id_quote: String
}
