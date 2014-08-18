//
//  ViewController.swift
//  tips
//
//  Created by Ryan Sims on 8/17/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var bottomView : UIView
    @IBOutlet var bottomControlsView : UIView
    @IBOutlet var bottomBoxView : UIView

    @IBOutlet var billField : UITextField
    @IBOutlet var tipLabel : UILabel
    @IBOutlet var totalLabel : UILabel
    @IBOutlet var tipControl : UISegmentedControl

    @IBOutlet var tipLabelTwo : UILabel
    @IBOutlet var tipLabelThree : UILabel
    @IBOutlet var tipLabelFour : UILabel
    
    let bottomViewOriginY = 420
    let bottomViewDestinationY = 320

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField .becomeFirstResponder()
        bottomView.center = CGPoint(x: 320/2, y: bottomViewOriginY)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender : AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        if billAmount != 0 {
            UIView.animateWithDuration(0.3, animations: {
                self.tipControl.alpha = 1.0
                self.bottomControlsView.alpha = 1.0
                self.bottomBoxView.alpha = 1.0
                self.bottomView.center = CGPoint(x: 320/2,y: self.bottomViewDestinationY)
            })
        } else {
            UIView.animateWithDuration(0.3, animations: {
                self.tipControl.alpha = 0
                self.bottomControlsView.alpha = 0
                self.bottomBoxView.alpha = 0
                self.bottomView.center = CGPoint(x: 320/2,y: self.bottomViewOriginY)
                })
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        tipLabelTwo.text = String(format: "$%.2f", (tip/2))
        tipLabelThree.text = String(format: "$%.2f", (tip/3))
        tipLabelFour.text = String(format: "$%.2f", (tip/4))

        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender : AnyObject) {
        view.endEditing(true)
    }
}

