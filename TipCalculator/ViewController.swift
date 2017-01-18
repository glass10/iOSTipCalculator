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
    @IBOutlet weak var totalText: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var splitView: UIView!
    
    @IBOutlet weak var moneyText: UILabel!
    
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitSliderText: UILabel!
    @IBOutlet weak var splitText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipSlider.setValue(12, animated: true);
        sliderLabel.text = "12%";
        billView.alpha = 0.0;
        tipView.alpha = 0.0;
        totalLabel.alpha = 0.0;
        totalText.alpha = 0.0;
        moneyText.alpha = 0.0;
        splitView.alpha = 0.0;
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 1.5, animations: {
            self.billView.alpha = 1.0
        })
        UIView.animate(withDuration: 1.5, delay: 0.5, animations: {
            self.tipView.alpha = 1.0
        })
        UIView.animate(withDuration: 1.5, delay: 1, animations: {
            self.totalLabel.alpha = 1.0;
            self.totalText.alpha = 0.5
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
        UIView.animate(withDuration: 1, delay: 0.5,animations: {
            self.splitView.alpha = 1.0;
        })
        
        self.splitChange(tipSlider)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let sliderValue = Double(tipSlider.value);
        totalLabel.adjustsFontSizeToFitWidth = true;
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * (sliderValue / 100);
        let total = bill + tip;
    
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        sliderLabel.text = String(format: "%.0f",sliderValue) + "%";
        
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func sliderChanged(_ sender: Any) {
        tipSlider.setValue(Float(lroundf(tipSlider.value)), animated: true)
        self.calculateTip(tipSlider)
        
        self.splitChange(tipSlider)
        
    }
    @IBAction func enterStart(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.moneyText.alpha = 1.0;
        })
    }
    @IBAction func enterEnd(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.moneyText.alpha = 0.0;
        })
    }
    @IBAction func startEdit(_ sender: Any) {
        self.splitView.alpha = 0.0;
    }
    @IBAction func splitChange(_ sender: Any) {
        let sliderValue = Double(tipSlider.value);
        splitText.adjustsFontSizeToFitWidth = true;
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * (sliderValue / 100);
        let total = bill + tip;
        
        let splitValue = round(Double(splitSlider.value))
        splitText.text = String(format: "$%.2f", (total / splitValue))
        
        if(splitValue > 1){
            splitSliderText.text = String(format: "%.0f",splitValue) + " People";
        }
        else {
            splitSliderText.text = String(format: "%.0f",splitValue) + " Person";
        }
        
    }
    


}

