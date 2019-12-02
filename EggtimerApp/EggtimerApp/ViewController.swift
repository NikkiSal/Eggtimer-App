//
//  ViewController.swift
//  EggtimerApp
//
//  Created by Nikki on 2019-11-30.
//  Copyright © 2019 Myph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft":3, "Medium" : 6, "Hard": 7]
    var counter = 60
    var timer = Timer()
    var totalTime = 100

    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        timer.invalidate() // stops the timer first if there were any
        let hardness = sender.currentTitle!
        totalTime = (eggTimes[hardness]!)
        counter = (eggTimes[hardness]!)
        TitleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true) // this calls the updateCounter function at every timeInterval.
    }

    @objc func updateCounter() {
            //example functionality
            if counter > 0 {
                
                print("\(counter) seconds.")
                counter -= 1
                progressBar.progress = (Float(totalTime-counter))/Float(totalTime)
            } else {
                timer.invalidate()
                TitleLabel.text = "Done"
                //Code should execute after 3 second delay.
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.TitleLabel.text = "How do you like your eggs?"
                    self.progressBar.progress = 0.0            }
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
    




    




