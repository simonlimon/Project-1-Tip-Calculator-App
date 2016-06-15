//
//  ViewController.swift
//  teep
//
//  Created by Simon Posada Fishman on 6/14/16.
//  Copyright © 2016 Simon Posada Fishman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var circle: Circle!
    @IBOutlet weak var tipPercent: UILabel!
    
    
    var tipValue = 20.0
    let tipPercentages = [0.18, 0.2, 0.22]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        UINavigationBar.appearance().backgroundColor = UIColor.blackColor()
        
        
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipValue = defaults.doubleForKey("default_tip_percentage")
        
        if (tipValue == 0.18) {
            tipControl.selectedSegmentIndex = 0
        } else if (tipValue == 0.2) {
            tipControl.selectedSegmentIndex = 1
        } else if (tipValue == 0.22) {
            tipControl.selectedSegmentIndex = 2
        }
        
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex])

        calculateTip(self)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    @IBAction func calculateTip(sender: AnyObject) {
        
        if (tipControl.selectedSegmentIndex != -1) {
            if (tipValue != tipPercentages[tipControl.selectedSegmentIndex]) {
                tipControl.selectedSegmentIndex = -1
            }
        }
        
        let bill = Double(billField.text!) ?? 0
        
        tipValue = Double(tipSlider.value)
        
        circle.frame = CGRectMake(view.frame.midX - CGFloat(tipValue * 1000)/2, 456.0 - CGFloat(tipValue * 1000)/2, CGFloat(tipValue * 1000), CGFloat(tipValue * 1000))
        
        tipPercent.text = String(format: "%.0f", tipValue * 100) + "%"
        
        let tip = bill * Double(round(100*tipValue)/100)
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func changeTipValue(sender: AnyObject) {

        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex])
        tipValue = Double(tipSlider.value)
        
        calculateTip(self)
    }
    
    @IBAction func sliderTouched(sender: AnyObject) {
        tipLabel.hidden = true
        tipPercent.hidden = false
    }
    
    
    @IBAction func sliderReleased(sender: AnyObject) {
        tipLabel.hidden = false
        tipPercent.hidden = true
    }
    
    
}

