//
//  SettingsViewController.swift
//  teep
//
//  Created by Simon Posada Fishman on 6/14/16.
//  Copyright © 2016 Simon Posada Fishman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        
        if (tipValue == 0.18) {
            defaultTip.selectedSegmentIndex = 0
        } else if (tipValue == 0.2) {
            defaultTip.selectedSegmentIndex = 1
        } else if (tipValue == 0.22) {
            defaultTip.selectedSegmentIndex = 2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefault(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentages[defaultTip.selectedSegmentIndex], forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
