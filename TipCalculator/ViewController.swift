//
//  ViewController.swift
//  TipCalculator
//
//  Created by Cameron Glass on 1/16/17.
//  Copyright © 2017 Cameron Glass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipController: UISegmentedControl!

    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let sliderValue = Double(tipSlider.value);
        
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * (sliderValue / 100);
        let total = bill + tip;
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        sliderLabel.text = String(format: "%.0f",sliderValue) + "%";
    }
    @IBAction func tipChanged(_ sender: Any) {
        self.calculateTip(tipController)
    }
    @IBAction func sliderChanged(_ sender: Any) {
        tipSlider.setValue(Float(lroundf(tipSlider.value)), animated: true)
        self.calculateTip(tipSlider)
    }



}

