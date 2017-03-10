//
//  ViewController.swift
//  tippy
//
//  Created by Jessica Thrasher on 3/1/17.
//  Copyright © 2017 Cisco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipNameLabel: UILabel!
    @IBOutlet weak var totalNameLabel: UILabel!
    @IBOutlet weak var billNameLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTipIndex")
        tipControl.selectedSegmentIndex = intValue

        let darkTheme = defaults.bool(forKey: "darkTheme")

        let tippyBlue = UIColor(red: 188/255, green: 219/255, blue: 1, alpha: 1)

//        print("THING \(Double(tipLabel.text!) ?? 0)")
//        
//        let localizedTip = NumberFormatter.localizedString(from: NSNumber(value: Double(tipLabel.text!) ?? 0), number: .currency)
//        let localizedTotal = NumberFormatter.localizedString(from: NSNumber(value: Double(totalLabel.text!) ?? 0), number: .currency)
//        
//        tipLabel.text = localizedTip
//        totalLabel.text = localizedTotal
        
        if darkTheme {
            tipNameLabel.textColor = tippyBlue
            billNameLabel.textColor = tippyBlue
            totalNameLabel.textColor = tippyBlue
            tipLabel.textColor = tippyBlue
            totalLabel.textColor = tippyBlue
            tipControl.backgroundColor = UIColor.darkGray
            self.resultsView.backgroundColor = UIColor.black
            tipControl.tintColor = tippyBlue
            self.view.backgroundColor = UIColor.black
            navigationController?.navigationBar.titleTextAttributes = [
                NSForegroundColorAttributeName : tippyBlue,
                NSFontAttributeName : UIFont(name: "ATypewriterForMe", size: 26)!
            ]
            self.navigationController?.navigationBar.barTintColor = UIColor.black

        } else {
            tipNameLabel.textColor = UIColor.black
            billNameLabel.textColor = UIColor.black
            totalNameLabel.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            tipControl.backgroundColor = tippyBlue
            tipControl.tintColor = UIColor.darkGray
            self.view.backgroundColor = tippyBlue
            self.resultsView.backgroundColor = tippyBlue
            navigationController?.navigationBar.titleTextAttributes = [
                NSForegroundColorAttributeName : UIColor.black,
                NSFontAttributeName : UIFont(name: "ATypewriterForMe", size: 26)!
            ]
            self.navigationController?.navigationBar.barTintColor = tippyBlue

        }

        billField.becomeFirstResponder()
        calculateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Don't end editing - keyboard will always appear
//    @IBAction func onTap(_ sender: Any) {
//        view.endEditing(true)
//    }

    @IBAction func valueChanged(_ sender: Any) {
        calculateTip(sender)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTip()
    }
    
    func calculateTip() {
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        
        if bill == 0 {
            self.resultsView.alpha = 0
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.resultsView.alpha = 1
            })
        }
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let localizedTip = NumberFormatter.localizedString(from: NSNumber(value: tip), number: .currency)
        
        let localizedTotal = NumberFormatter.localizedString(from: NSNumber(value: total), number: .currency)
        
        tipLabel.text = localizedTip
        totalLabel.text = localizedTotal
    }
}

