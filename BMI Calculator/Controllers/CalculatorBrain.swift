//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dylan Perry on 12/29/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var height: Float
    var weight: Float
    var heightString: String
    var weightString: String
    var bmi: BMI?
    
    let defaultBMI = "0.0"
    let errorAdvice = "There was an error calculating BMI"
    let errorColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    
    let advice = [
        "underweight": "Eat more pies!",
        "overweight": "You're  fit as a fiddle!",
        "normal": "Eat less pies!"
    ]
    
    let colors = [
        "underweight" : #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
        "overweight" : #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),
        "normal":#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    ]
    
    init(height: Float, weight: Float) {
        self.weight = weight.roundToDecimal(0)
        self.weightString = "\(String(format: "%.0f", self.weight))Kg"
        
        self.height = height.roundToDecimal(2)
        self.heightString =  "\(String(format: "%.2f", self.height))m"
    }
    
    mutating func setWeight(weight: Float){
        self.weight = weight.roundToDecimal(0)
        self.weightString = "\(String(format: "%.0f", self.weight))Kg"
    }
    
    mutating func setHeight(height: Float){
        self.height = height.roundToDecimal(2)
        self.heightString =  "\(String(format: "%.2f", self.height))m"
    }

    mutating func calculateBMI(){
        let bmiValue = weight / pow(height, 2)
        switch bmiValue {
        case 0..<18.5:
            bmi = BMI(value: String(format: "%0.1f",bmiValue), advice: advice["underweight"]!, color: colors["underweight"]!)
        case 18.5..<24.91:
                bmi = BMI(value: String(format: "%0.1f",bmiValue), advice: advice["normal"]!, color: colors["normal"]!)
        case 24.91...Float.greatestFiniteMagnitude:
            bmi = BMI(value: String(format: "%0.1f",bmiValue), advice: advice["overweight"]!, color: colors["overweight"]!)
        default:
            bmi = BMI(value: String(format: "%0.1f",bmiValue), advice: advice["underweight"]!, color: colors["underweight"]!)
        }
    }
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

extension Float {
    func roundToDecimal(_ fractionDigits: Int) -> Float {
        let multiplier = Float(pow(10, Double(fractionDigits)))
        return Darwin.round(self * multiplier) / multiplier
    }
}
