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
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValString = ""
    var rightValString = ""
    
    
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
        btnSound.play()
    }

    

}

