//
//  ViewController.swift
//  EggtimerApp
//
//  Created by Nikki on 2019-11-30.
//  Copyright © 2019 Myph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft":5*60, "Medium" : 8*60, "Hard": 12*60]
    var counter = 60
    var timer = Timer()
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        progressBar.progress = 1.0
        timer.invalidate() // stops the timer first if there were any
        let hardness = sender.currentTitle!
        counter = (eggTimes[hardness]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true) // this calls the updateCounter function at every timeInterval.
        
       
    }

    @objc func updateCounter() {
            //example functionality
            if counter > 0 {
                print("\(counter) seconds.")
                counter -= 1
            } else {
                timer.invalidate()
                TitleLabel.text = "Done"
            }
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
    




    




