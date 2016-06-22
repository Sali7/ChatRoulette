//
//  MainViewController.swift
//  ChatRoulette
//
//  Created by MBE on 22.06.16.
//  Copyright © 2016 MBE. All rights reserved.
//

import Foundation
import UIKit

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
       timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(rotateWheel), userInfo: nil, repeats: true)

    }
    
    func rotateWheel() {
        //set your angle here
        //self.wheelImage.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 90.0)
        if(position){
            UIView.animateWithDuration(2.0, animations: {
                self.wheelImage.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
            })
            position = false
        } else{
            UIView.animateWithDuration(2.0, animations: {
                self.wheelImage.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 90.0)
            })
            position = true
        }
      
    }
}