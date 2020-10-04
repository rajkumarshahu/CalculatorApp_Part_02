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

    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func OnNumberButton_Press(_ sender: UIButton)
    {
        print(sender.titleLabel?.text)
    }
    
    @IBAction func OnOperatorButton_Press(_ sender: UIButton)
    {
        print(sender.titleLabel?.text)
    }
}

