//
//  MiscViewController.swift
//  Fitn3ss
//
//  Created by var shmet on 4/2/23.
//

import UIKit

class MiscViewController: UIViewController {

    
    @IBOutlet var heightFeet: UITextField!
    @IBOutlet var heightInches: UITextField!
    @IBOutlet var weight: UITextField!
    @IBOutlet var result: UILabel!
    
    let kilo = Double()
    let height = Double()
    let calcu = Double()

    @IBAction func calculateBMI(_ sender: Any) {
        //convert to KG
        let kg = Double(weight.text!)! * 0.45
        //convert height
        let height = (Double(heightFeet.text!)! * 12) + Double(heightInches.text!)!
        
        //calculation for BMI
        let bmi = 703 * Double(weight.text!)! / (height * height)
        
        let final = String(format: "%.2f", arguments: [bmi])
        
        if bmi <= 18.5 {
            result.text = "\(final)\nYou are Underweight"
        }
        else if bmi <= 24.9 && bmi > 18.5{
            result.text = "\(final)\nYou are Normal Weight"
        }
        else if bmi <= 29.9 && bmi > 24.9{
            result.text = "\(final)\nYou are Overweight"
        }
        else if bmi <= 34.9 && bmi > 29.9 {
            result.text = "\(final)\nYou are C1 Obese"
        }
        else if bmi <= 39.9 && bmi > 34.9 {
            result.text = "\(final)\nYou are C2 Obese"
        }
        else if bmi <= 40 && bmi > 39.9 {
            result.text = "\(final)\nYou are C3 Obese"
        }
        else {
            result.text = "\(final)\nSeek Help 💀"
        }
        
        print("test")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
