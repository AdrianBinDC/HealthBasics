//
//  FirstViewController.swift
//  HealthBasics
//
//  Created by Adrian Bolinger on 3/28/16.
//  Copyright © 2016 Adrian Bolinger. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func healthIntegrationButtonSwitched(sender: UISwitch) {
        
        if (sender.on) {
            GSHealthKitManager.sharedManager.requestAuthorization()
        } else {
            // Possibly disable HealthKit functionality in your app
        }
        
    }

    @IBAction func readAgeButtonPressed(sender: UIButton) {
        let birthDate = GSHealthKitManager.sharedManager.readBirthDate()

        if (birthDate == nil) {
            // Either user didn't set a date or an error occurred
            return
        }
        
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        
        let ageComponents = calendar.components(.Year, fromDate: birthDate!, toDate: now, options: [])
        
        ageLabel.text = String(ageComponents.year)
    }
    
    @IBAction func writeWeightButtonPressed(sender: UIButton) {
        
        GSHealthKitManager.sharedManager.writeWeightSample(Double(self.weightTextField.text!)!)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

