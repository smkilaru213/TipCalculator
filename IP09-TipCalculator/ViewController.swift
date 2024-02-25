//
//  ViewController.swift
//  IP09-TipCalculator
//
//  Created by SaiManasa on 12/2/23.
//


import UIKit
 
class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var otherAmountTextField: UITextField!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet var tipAmount: UILabel!
    @IBOutlet var totalAmount: UILabel!
    
    var tip: Double = 0.15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otherAmountTextField.isHidden = true
    }
    
    @IBAction func billAmountChanged(_ sender: Any) {
        let tipAmountDouble = (Double(billAmountTextField.text!)! * tip)
        let totalAmountDouble = tipAmountDouble + Double(billAmountTextField.text!)!
        tipAmount.text = "$ \(String(format: "%.2f", tipAmountDouble))"
        totalAmount.text = "$ \(String(format: "%.2f", totalAmountDouble))"
    }
    
    @IBAction func tipAmountChanegd(_ sender: Any) {
        tip = Double(otherAmountTextField.text!)!/100.0
        let tipAmountDouble = (Double(billAmountTextField.text!)! * tip)
        let totalAmountDouble = tipAmountDouble + Double(billAmountTextField.text!)!
        tipAmount.text = "$ \(String(format: "%.2f", tipAmountDouble))"
        totalAmount.text = "$ \(String(format: "%.2f", totalAmountDouble))"
    }
    
    @IBAction func tipToggled(_ sender: Any) {
        switch tipSegmentedControl.selectedSegmentIndex{
        case 0:
            tip = 0.15
            otherAmountTextField.isHidden = true
        case 1:
            tip = 0.18
            otherAmountTextField.isHidden = true
        case 2:
            tip = 0.20
            otherAmountTextField.isHidden = true
        case 3:
            otherAmountTextField.isHidden = false
        default:
            tip = 0.15
            otherAmountTextField.isHidden = true
        }
        let tipAmountDouble = (Double(billAmountTextField.text!)! * tip)
        let totalAmountDouble = tipAmountDouble + Double(billAmountTextField.text!)!
        tipAmount.text = "$ \(String(format: "%.2f", tipAmountDouble))"
        totalAmount.text = "$ \(String(format: "%.2f", totalAmountDouble))"
    }
    
    @IBAction func reset(_ sender: Any) {
        tip = 0.15
        billAmountTextField.text = ""
        otherAmountTextField.text = ""
        otherAmountTextField.isHidden = true
        tipSegmentedControl.selectedSegmentIndex = 0
        tipAmount.text = "$0"
        totalAmount.text = "$0"
    }
}
