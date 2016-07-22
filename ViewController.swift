//
//  ViewController.swift
//  Calculator
//
//  Created by le ha thanh on 7/12/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var distanceBetweenInputTextFieldAndResultLabel: NSLayoutConstraint!

    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    @IBOutlet weak var resultLabel: UILabel!

    var isTappingNumber : Bool = false
    var isEndOperation : Bool = true
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var operation : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inputTextField.userInteractionEnabled = false
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        updateContraints()
    }
    
    
    func updateContraints() -> Void {
        
        let scale = UIScreen.mainScreen().bounds.size.height / 667
        
        distanceBetweenResultLabelAndMiddleView.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBetweenResultLabelAndMiddleView.constant * scale : distanceBetweenResultLabelAndMiddleView.constant * 0.1
        
        distanceBetweenInputTextFieldAndResultLabel.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBetweenInputTextFieldAndResultLabel.constant * scale : distanceBetweenInputTextFieldAndResultLabel.constant * 0.1
    }
    
    @IBAction func numberAction(sender: UIButton){
        let number = sender.currentTitle
        
        if isTappingNumber {
            inputTextField.text = inputTextField.text! + number!
        } else {
            inputTextField.text = number
            isTappingNumber = true
        }
    }
    
    @IBAction func operatorAction(sender: UIButton) {
       operation = sender.currentTitle!
        if let inputOperation = Double(inputTextField.text!){
            if isEndOperation {
                firstNumber = inputOperation
                isEndOperation = false
            } else {
                firstNumber = Double(resultLabel.text!)!
                inputTextField.text = "\(firstNumber)"
            }
            
        } else {
            print("Nhap so truoc khi tinh toan")
        }
        
        isTappingNumber = false
        if operation == "%" {
            equalAction(sender)
        } else if operation == "+/-" {
            equalAction(sender)
        }
        
    }
    
    @IBAction func equalAction(sender: UIButton){
        isTappingNumber = false
        var result : Double = 0
        if let realSecondNumber = Double(inputTextField.text!){
            secondNumber = realSecondNumber
        }
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber / 100
        case "+/-":
            if firstNumber < 0 {
                firstNumber = fabs(firstNumber)
                result = firstNumber
            }else{
                firstNumber = -1 * firstNumber
                result = firstNumber
            }
            inputTextField.text = "\(result)"
        default:
            print("Error Operation")
        }
        
        resultLabel.text = "\(result)"    }
    
    @IBAction func ACAction(sender: AnyObject){
        firstNumber = 0
        secondNumber = 0
        inputTextField.text = ""
        resultLabel.text = "0"
        isEndOperation = true
    }
}

