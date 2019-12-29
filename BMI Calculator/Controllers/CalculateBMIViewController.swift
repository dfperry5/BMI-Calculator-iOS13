//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateBMIViewController: UIViewController {

    
    @IBOutlet weak var heightAmountLabel: UILabel!
    @IBOutlet weak var weightAmountLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain(height: 1.5, weight: 100.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func updateUI(){
        heightAmountLabel.text = calculatorBrain.heightString
        weightAmountLabel.text = calculatorBrain.weightString
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        calculatorBrain.setHeight(height: sender.value)
        updateUI()
       
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        calculatorBrain.setWeight(weight: sender.value)
        updateUI()
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculatorBrain.calculateBMI()
        self.performSegue(withIdentifier: "showResults", sender: self)
        
        
        // manual presentation.
        // let secondVC = SecondViewController()
        // secondVC.bmiValue = "\(String(format: "%.1f", bmi))"
        //
        // self.present(secondVC, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "showResults":
                guard let destinationVC = segue.destination as? BMIResultViewController else {
                    print("Invalid Destination View Controller")
                    return
                }
                destinationVC.bmiValue = calculatorBrain.bmi?.value ?? calculatorBrain.defaultBMI
                destinationVC.advice = calculatorBrain.bmi?.advice ?? calculatorBrain.errorAdvice
                destinationVC.color = calculatorBrain.bmi?.color ?? calculatorBrain.errorColor
            
            
            default:
                print("Invalid segue")
        }
      
    }
    
}

