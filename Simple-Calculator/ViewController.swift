//
//  ViewController.swift
//  Simple-Calculator
//
//  Created by Администратор on 26.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var mathSign: Bool = false
    var operation: Int = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func zeroButton(_ sender: UIButton) {
        
        if mathSign == true {
            resultLabel.text = String(sender.tag)
            mathSign = false
        } else {
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        
        
        numberFromScreen = Double(resultLabel.text!)!
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 10 && sender.tag != 15 {
            
            firstNum = Double(resultLabel.text!)!
            
            if sender.tag == 11 { // деление
                resultLabel.text = "/"
            }
            else if sender.tag == 12 { //умножение
                resultLabel.text = "*"
            }
            else if sender.tag == 13 { // вычитание
                resultLabel.text = "-"
            }
            else if sender.tag == 14 { // сложение
                resultLabel.text = "+"
            }
            operation = sender.tag
            mathSign = true
        } else if sender.tag == 15 { // equal
            if operation == 11 {
                resultLabel.text = String(firstNum / numberFromScreen)
            } else  if operation == 12 {
                resultLabel.text = String(firstNum * numberFromScreen)
            } else  if operation == 13 {
                resultLabel.text = String(firstNum - numberFromScreen)
            } else  if operation == 14 {
                resultLabel.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            resultLabel.text?.removeAll()
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

