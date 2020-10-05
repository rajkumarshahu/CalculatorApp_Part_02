//
//  ViewController.swift
//  CalculatorApp_Part_02
//
//  Created by Raj Kumar Shahu on 2020-10-02.
//  Copyright © 2020 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UIViewController
    {
        var operand1: Double = 0.0
        var operand2: Double = 0.0
        var result: Double = 0.0
        var activeOperation: String = ""
        var activeNumber: String = ""
        var operation_result = 0.0;
        var old_operator = "";
    var is_active = true;

    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func OnNumberButton_Press(_ sender: UIButton)
    {
        switch sender.titleLabel?.text! {
        case "C":
            ResultLabel.text! = "0"
            operand1=0.0
            operand2=0.0
            operation_result = 0.0
            activeOperation = ""
            old_operator = ""
            is_active = true;
        case "⌫":
            ResultLabel.text!.removeLast()
            if((ResultLabel.text!.count < 1) || (ResultLabel.text! == "-"))
            {
                ResultLabel.text! = "0"
            }
        case ".":
            if(!ResultLabel.text!.contains("."))
            {
                ResultLabel.text! += "."
            }
        case "+/-":
            if(ResultLabel.text! != "0")
            {
                if(!ResultLabel.text!.contains("-"))
                {
                    ResultLabel.text!.insert("-", at: ResultLabel.text!.startIndex)
                }
                else
                {
                    ResultLabel.text!.remove(at: ResultLabel.text!.startIndex)
                }
            }
        default:
            if(is_active || ResultLabel.text! == "0")
            {
                ResultLabel.text = sender.titleLabel!.text!
                is_active = false;
            } else
            {
                if(ResultLabel.text!.count > 7 ) {
                    return
                }
                ResultLabel.text! += sender.titleLabel!.text!
            }
        }
        
        if(ResultLabel.text!.contains("."))
        {
           print(Double(ResultLabel.text!)!)
        }
        else
        {
           print(Int(ResultLabel.text!)!)
        }
        
    }
    
    @IBAction func OnOperatorButton_Press(_ sender: UIButton)
    {
        activeOperation = sender.titleLabel!.text!
        
        if(old_operator == "") {
            old_operator = activeOperation
            is_active = true;
        }
        
        if(operation_result != 0.0) {
            return
        }
        if(operand1 != 0.0) {
            operand2 = Double(ResultLabel.text!)!
        } else {
            operand1 = Double(ResultLabel.text!)!
        }
        
        if(operand2 == 0.0 && activeOperation != "=")
        {
            //print("operand2")
            return
        }
        
        switch old_operator
        {
        case "+":
            print(operand2)
            operation_result = operand1 + operand2
        case "-":
            operation_result = operand1 - operand2
        case "X":
            operation_result = operand1 * operand2
        case "÷":
            operation_result = operand1 / operand2
        case "%":
            print(sender.titleLabel!.text!)
            print(old_operator)
        case "=":
            operation_result = operand1;
        default:
            print("Error....")
        }
        operand1 = operation_result
        operand2 = 0.00;
        old_operator = activeOperation
        is_active = true
        ResultLabel.text! = String(round(pow(10, 9)*operation_result)/pow(10, 9))
        operation_result = 0.00;
    }
}

