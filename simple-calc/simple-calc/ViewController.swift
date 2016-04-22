//
//  ViewController.swift
//  simple-calc
//
//  Created by Chris Maglio on 4/20/16.
//  Copyright © 2016 Chris Maglio. All rights reserved.
//
import Foundation

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Display: UILabel!
    
    var array = [Int]()
    var str = ""
    var oper = ""
    var result = ""
    @IBAction func Input(sender: UIButton) {
        let x = sender.currentTitle!
        switch x {
        case "0" ... "9" :
            str = str + x
            Display.text = str
        case "X", "/", "-", "+", "%", "Count", "Avg" :
            oper = x
            array.append(Int(str)!)
            str = ""
            Display.text = x
        case "Equals" :
            array.append(Int(str)!)
            Display.text = aritmetic(array, op : oper)
            str = ""
            oper = ""
            array = [Int]()
        case "Fact" :
            var total = 1
            array.append(Int(str)!)
            let y = array[0]
            if y > 0 {
                for index in 1...y {
                    total = total * index
                }
            }
            Display.text = "\(total)"
            str = ""
            oper = ""
            array = [Int]()
        case "Clear" :
            str = ""
            oper = ""
            array = [Int]()
            Display.text = ""
        default :
            str = x
        }
    }
    
    func aritmetic(array : Array<Int>, op : String) -> String {
        var total = 0
        switch op {
        case "X" :
            total = 1
            for index in array {
                total = total * index
            }
        case "/" :
            return "\(Double(Double(array[0]) / Double(array[1])))"
        case "+" :
            for index in array {
                total = total + index
            }
        case "-" :
            total = array[0] * 2
            for index in array {
                total = total - index
            }
        case "%" :
            total = array[0] % array[1]
        case "Avg" :
            for index in array {
                total = total + index
            }
            return "\(total / array.count)"
        case "Count" :
            total = array.count
        default :
            return "\(total)"
        }
        return "\(total)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

