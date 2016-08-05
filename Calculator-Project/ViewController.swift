//
//  ViewController.swift
//  Calculator-Project
//
//  Created by YourboyE on 7/26/16.
//  Copyright © 2016 YourboyE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


// outlets
    
    @IBOutlet weak var outputlbl:UILabel!
    
// variables
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValString = ""
    var rightValString = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""

// setting up sound
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)// print debugging error
        }
    
    }
    

    @IBAction func numberPressed(btn: UIButton!){
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputlbl.text = runningNumber
    }

    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }

    @IBAction func onAdditionPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearBtnPressed(sender: AnyObject) {
        playSound()
        runningNumber = ""
        outputlbl.text = "0"
        leftValString = ""
        rightValString = ""
        currentOperation = Operation.Empty
        result = ""
    }
    
    
    func processOperation(op: Operation){
        playSound()
        
        if currentOperation != Operation.Empty {
            // run some math
            
            // A user selected an operator, but then selected another operator without first entering a number
            
            if runningNumber != "" {
            
            rightValString = runningNumber
            runningNumber = ""
            
            if currentOperation == Operation.Multiply {
                result = "\(Double(leftValString)! * Double(rightValString)!)"
            } else if currentOperation == Operation.Divide {
                result = "\(Double(leftValString)! / Double(rightValString)!)"
            } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
            } else if currentOperation == Operation.Add {
                result = "\(Double(leftValString)! + Double(rightValString)!)"
            }
            
            leftValString = result
            outputlbl.text = result
            
            }
            
            currentOperation = op
    
        } else {
            // This is the first time the operator has been pressed
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = op
        }
        
    }
    
    func playSound(){
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    
    
    
}

