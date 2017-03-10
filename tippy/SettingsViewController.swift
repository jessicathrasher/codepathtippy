//
//  SettingsViewController.swift
//  tippy
//
//  Created by Jessica Thrasher on 3/3/17.
//  Copyright © 2017 Cisco. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    @IBOutlet weak var darkThemeSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTipIndex")
        defaultTipControl.selectedSegmentIndex = intValue
        darkThemeSwitch.setOn(defaults.bool(forKey: "darkTheme"), animated: false)
        
        let tippyBlue = UIColor(red: 188/255, green: 219/255, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = tippyBlue
    }

    @IBAction func onDarkThemeChanged(_ sender: Any) {
        let defaults = UserDefaults.standard

        if darkThemeSwitch.isOn {
            defaults.set(true, forKey: "darkTheme")
        } else {
           defaults.set(false, forKey: "darkTheme")
        }

        defaults.synchronize()
    }
    

    @IBAction func onDefaultTipChanged(_ sender: Any) {
        
        let defaultTipIndex = defaultTipControl.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTipIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
    }
}
