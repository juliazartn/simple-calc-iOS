//
//  ViewController.swift
//  simple-calc
//
//  Created by Julia Zaratan on 1/26/18.
//  Copyright © 2018 Julia Zaratan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculateLabel: UILabel!

    var currentTotal : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculateLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func number1(_ sender: UIButton) {
        self.calculateLabel.text = self.calculateLabel.text! + String(sender.tag)
    }
    
    @IBAction func clearLabel(_ sender: Any) {
        self.calculateLabel.text = ""
    }
    
    @IBAction func operations(_ sender: UIButton) {
        var opString : String = ""
        
        switch sender.tag {
        case 10 : //equals
            let newLabel : String = String(equals(self.calculateLabel.text!))
            self.calculateLabel.text = newLabel
        case 11: //plus
            opString = " + "
        case 12: //minus
            opString = " - "
        case 13: //multiply
            opString = " x "
        case 14: //divide
            opString = " / "
        case 15: //mod
            opString = " % "
        case 16: //avg
            opString = " avg "
        case 17: //count
            opString = " count "
        case 18: //fact
            var arr : [String] = self.calculateLabel.text!.split(separator: " ").map({ substr in String(substr) })
            var num = Int(arr[0])! - 1
            var ans = Int(arr[0])!
            while num > 0 {
                ans = ans * num
                num = num - 1
            }
            self.calculateLabel.text = String(ans)
        default:
            opString = " "
        }
        self.calculateLabel.text = self.calculateLabel.text! + opString
    }
    
    func equals( _ args: String) -> Int {
        var arr : [String] = args.split(separator: " ").map({ substr in String(substr) })
        
        if arr[1] == "count" {
            var count : Int = 0
            for n in arr {
                if n != "count" {
                    count += 1
                }
            }
            return count
        }
        else if arr[1] == "avg" {
            var count : Int = 0
            var avg : Int = 0
            for n in arr {
                if n != "avg" {
                    avg += Int(n)!
                    count += 1
                    print("avg : \(avg) count: \(count))")
                }
            }
            return avg / count
        }
        else if arr.count == 3 {
            let op = arr[1]
            let firstNum = Int(arr[0])
            let secondNum = Int(arr[2])
            switch op {
            case "-":
                return firstNum! - secondNum!
            case "+":
                return firstNum! + secondNum!
            case "/":
                return firstNum! / secondNum!
            case "%":
                return firstNum! % secondNum!
            case "*":
                return firstNum! * secondNum!
            default:
                print("not an operation")
            }
        }
        
        return 0
    }
    
    
}



