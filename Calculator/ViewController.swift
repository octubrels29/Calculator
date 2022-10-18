//
//  ViewController.swift
//  Calculator
//
//  Created by 이승재 on 2022/10/18.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Devide
    case Multiply
    case Unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .Unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .Unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(_operation: .Devide)
    }
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(_operation: .Multiply)
    }
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(_operation: .Subtract)
    }
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(_operation: .Add)
    }
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(_operation: self.currentOperation)
    }
    
    func operation(_operation: Operation) {
        if self.currentOperation != .Unknown {
            if self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let seconfOperand = Double(self.secondOperand) else {return}
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + seconfOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - seconfOperand)"
                case .Devide:
                    self.result = "\(firstOperand / seconfOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * seconfOperand)"
                default:
                    break
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation = _operation
            
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = _operation
            self.displayNumber = ""
        }
        
    }
}

