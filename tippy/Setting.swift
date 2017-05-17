//
//  Setting.swift
//  tippy
//
//  Created by Tran Tien Tin on 5/17/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import Foundation
import UIKit

class Setting{
    let tipPercentage = [0.18, 0.2, 0.25]
    let themes = [(textColor: UIColor.black, backgroundColor: UIColor.white, tintColor: UIColor.blue), (textColor: UIColor.white, backgroundColor: UIColor.black, tintColor: UIColor.gray)]
    let userDefaults = UserDefaults.standard
    let PERCENTAGE_KEY = "percentage_key"
    let BILL_KEY = "bill_key"
    let TIME_KEY = "time_key"
    let THEME_KEY = "theme_key"
    
    // Can't init is singleton
    private init() { }
    
    static let shared = Setting()
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
    
    func initIfNeeded(){
        if (!isKeyPresentInUserDefaults(key: PERCENTAGE_KEY)){
            userDefaults.set(0, forKey: PERCENTAGE_KEY)
            userDefaults.synchronize()
        }
        if (!isKeyPresentInUserDefaults(key: THEME_KEY)){
            userDefaults.set(0, forKey: THEME_KEY)
            userDefaults.synchronize()
        }
    }
    
    func getSettingPercentage() -> Int {
        return userDefaults.integer(forKey: PERCENTAGE_KEY)
    }
    
    func setSettingPercentage(value: Int) {
        userDefaults.set(value, forKey: PERCENTAGE_KEY)
        userDefaults.synchronize()
    }
    
    func getSettingTheme() -> Int {
        return userDefaults.integer(forKey: THEME_KEY)
    }
    
    func setSettingTheme(value: Int) {
        userDefaults.set(value, forKey: THEME_KEY)
        userDefaults.synchronize()
    }
    
    func getLastBill() -> (bill: Double, time: Date) {
        return (bill: userDefaults.double(forKey: BILL_KEY),
                time: userDefaults.object(forKey: TIME_KEY) as? Date ?? Date().add(minutes: 100))
    }
    
    func setLastBill(bill: Double, time: Date) {
        userDefaults.set(bill, forKey: BILL_KEY)
        userDefaults.set(time, forKey: TIME_KEY)
        userDefaults.synchronize()
    }
    
    func formatCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2;
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: value as NSNumber);
        return result!;
    }
}
