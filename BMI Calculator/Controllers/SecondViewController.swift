//
//  BMIResultViewController.swift
//  BMI Calculator
//
//  Created by Dylan Perry on 12/29/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "BMI Value: \(bmiValue)"
        label.frame = CGRect(x:0, y:0, width: 200, height: 50)
        view.addSubview(label)
    }
    
}
