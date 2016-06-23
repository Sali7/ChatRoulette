//
//  MainViewController.swift
//  ChatRoulette
//
//  Created by MBE on 22.06.16.
//  Copyright © 2016 MBE. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation

class MainViewController : UIViewController{
    
    @IBOutlet weak var wheelImage: UIImageView!
    var timer:NSTimer!
    var position : Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stopWheelAction(sender: AnyObject) {
       timer.invalidate()
    }
    
    @IBAction func turnWheelAction(sender: AnyObject) {
       //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(rotateWheel), userInfo: nil, repeats: true)
       rotateWheel()
    }
    
    func rotateWheel() {
        var mySound: SystemSoundID = 0
        if let soundURL = NSBundle.mainBundle().URLForResource("wheel", withExtension: "wav") {
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound)
        }
        
        for _ in 1...10 {
            if(position){
                UIView.animateWithDuration(5.0, animations: {
                    self.wheelImage.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
                })
                position = false
            } else{
                UIView.animateWithDuration(5.0, animations: {
                    self.wheelImage.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 90.0)
                })
                position = true
            }
            
        }
        
        let randomTurn = arc4random_uniform(180) + 1
        UIView.animateWithDuration(2.0, animations: {
            self.wheelImage.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / CGFloat(randomTurn))
        })
        
        
    }
}