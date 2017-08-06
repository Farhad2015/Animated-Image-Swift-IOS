//
//  ViewController.swift
//  Animate Images
//
//  Created by Admin on 8/6/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgFrame: UIImageView!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    var isAnimating = false
    var timer = Timer()
    
    
    func animate() {
        imgFrame.image = UIImage(named: "frame_\(counter)_delay-0.08s.gif")
        counter += 1
        
        if counter == 38 {
            counter = 0
        }
    }
    
    var counter = 0
    @IBAction func btnNext(_ sender: Any) {
        
        if isAnimating {
            timer.invalidate()
            buttonOutlet.setTitle("Start Animation", for: [])
            isAnimating = false
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            buttonOutlet.setTitle("Stop Animation", for: [])
            isAnimating = true
        }
    }
    
    @IBAction func Fadein(_ sender: Any) {
        imgFrame.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            
            self.imgFrame.alpha = 1
            
        })

    }
    
    @IBAction func Slidein(_ sender: Any) {
        
        imgFrame.center = CGPoint(x: imgFrame.center.x - 500, y: imgFrame.center.y)
        
        UIView.animate(withDuration: 1) {
            self.imgFrame.center = CGPoint(x: self.imgFrame.center.x + 500, y: self.imgFrame.center.y)
        }
    }
    
    @IBAction func Grow(_ sender: Any) {
        
        imgFrame.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            
            self.imgFrame.frame = CGRect(x: 40, y: 160, width: 300, height: 300)
            
        }
        
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

