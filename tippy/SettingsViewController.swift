//
//  SettingsViewController.swift
//  tippy
//
//  Created by Tran Tien Tin on 5/17/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var themeControl: UISegmentedControl!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentageControl.selectedSegmentIndex = Setting.shared.getSettingPercentage()
        themeControl.selectedSegmentIndex = Setting.shared.getSettingTheme()
        changeTheme()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setTipPercentage(_ sender: Any) {
        print ("change value")
        Setting.shared.setSettingPercentage(value: tipPercentageControl.selectedSegmentIndex)
    }
    
    @IBAction func setTheme(_ sender: Any) {
        print ("change value")
        Setting.shared.setSettingTheme(value: themeControl.selectedSegmentIndex)
        changeTheme()
    }
    
    func changeTheme(){
        let theme = Setting.shared.themes[Setting.shared.getSettingTheme()]
        view.backgroundColor = theme.backgroundColor
        tipPercentageLabel.textColor = theme.textColor
        themeLabel.textColor = theme.textColor
        tipPercentageControl.tintColor = theme.tintColor
        themeControl.tintColor = theme.tintColor
            }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
