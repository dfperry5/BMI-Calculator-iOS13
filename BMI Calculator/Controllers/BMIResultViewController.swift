//
//  BMIResultViewController.swift
//  BMI Calculator
//
//  Created by Dylan Perry on 12/29/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class BMIResultViewController: UIViewController {

    
    @IBOutlet weak var bmiValueLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var advice: String?
    var bmiValue: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bmiValueLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("Result Screen Dismissed")
        }
        
    }
}
