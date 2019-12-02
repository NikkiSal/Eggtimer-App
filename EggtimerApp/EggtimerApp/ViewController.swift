//
//  ViewController.swift
//  EggtimerApp
//
//  Created by Nikki on 2019-11-30.
//  Copyright © 2019 Myph. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft":5, "Medium" : 8, "Hard": 12]
    var counter = 60
    var timer = Timer()
    var totalTime = 100
    var player: AVAudioPlayer!

    
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
                playSound()
                //Code should execute after 4 second delay.
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    self.TitleLabel.text = "How do you like your eggs?"
                    self.progressBar.progress = 0.0
            }
        }
    }
    
    func playSound() {
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
    }
}
    




    




