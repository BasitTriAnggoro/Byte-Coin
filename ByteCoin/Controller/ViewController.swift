//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}

//MARK: - CoinManager (Delegate)
extension ViewController: CoinManagerDelegate{
    func didUpdateCoin(_ coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(coin.rate)
            self.currencyLabel.text = String(coin.asset_id_quote)
        }
    }
    
    func didFailedWithError(error: any Error) {
        print(error)
    }
}

//MARK: - UIPicker (Delegate & DataSouce)
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    // row: id unik urutan baris si picker
    // component: id unik untuk si pickerview
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row,component,coinManager.currencyArray[row])
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}
