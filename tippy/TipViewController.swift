//
//  ViewController.swift
//  tippy
//
//  Created by Tran Tien Tin on 5/16/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipControl.selectedSegmentIndex = Setting.shared.getSettingPercentage()
        
        let lastBill = Setting.shared.getLastBill()
        
        print (lastBill.time)
        print (lastBill.bill)
        print (Date().add(minutes: -10))

        
        if lastBill.time > Date().add(minutes: -10) {
            billField.text = String.init(format: "%.0f", lastBill.bill)
            calculateTip(Any.self)
        }
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
//        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * Setting.shared.tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipField.text = Setting.shared.formatCurrency(value: tip)
        totalField.text = Setting.shared.formatCurrency(value: total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        changeTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        let bill = Double(billField.text!) ?? 0
        Setting.shared.setLastBill(bill: bill,time: Date())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
        
    }
    
    func changeTheme(){
        let theme = Setting.shared.themes[Setting.shared.getSettingTheme()]
        view.backgroundColor = theme.backgroundColor
        billField.tintColor = theme.tintColor
        tipField.textColor = theme.textColor
        totalField.textColor = theme.textColor
        billLabel.textColor = theme.textColor
        tipLabel.textColor = theme.textColor
        totalLabel.textColor = theme.textColor
        tipControl.tintColor = theme.tintColor
    }
}

extension Date {
    func add(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
}

