//
//  ViewController.swift
//  Calculator
//
//  Created by Wansoo Ryu on 2022/04/25.
//

import UIKit

enum Operation {
    case Add
    case Substract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    @IBOutlet weak var acButton: UIButton!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapNumberButton(_ sender: UIButton) {
//         // .title(for: .normal)을 사용하면 nil값 반환... 왜인지는 모르겠...
//        guard let numberValue = sender.title(for: .normal) else {return}
        guard let numberValue = sender.titleLabel?.text else { return }
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
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
                    self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
                    self.numberOutputLabel.text = self.displayNumber
                }
    }
    @IBAction func tapDivideButton(_ sender: Any) {
    }
    @IBAction func tapMultiplyButton(_ sender: Any) {
    }
    @IBAction func tapSubtractButton(_ sender: Any) {
    }
    @IBAction func tapAddButton(_ sender: Any) {
    }
    @IBAction func tapEqualButton(_ sender: Any) {
    }
    
}

