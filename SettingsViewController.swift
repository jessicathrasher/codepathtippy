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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTipIndex")
        defaultTipControl.selectedSegmentIndex = intValue
    }
    
    @IBAction func onDefaultTipChanged(_ sender: Any) {
        
        let defaultTipIndex = defaultTipControl.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTipIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
    }
}
