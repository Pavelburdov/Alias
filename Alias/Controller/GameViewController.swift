//
//  GameViewController.swift
//  Alias
//
//  Created by Pavel on 28.07.2022.
//

import UIKit
import AVFoundation


class GameViewController: UIViewController {

    var score = 0
    var secondReminder = 60
    var timer = Timer()
    var player: AVAudioPlayer!


    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    var categoryManager: CategoryManager? 
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
//        print(timeFormatted(secondReminder))
        if secondReminder != 0 {
            secondReminder -= 1
            secondLabel.text = "\(secondReminder)"
        } else {
            endTimer()
        }

        func endTimer() {
            timer.invalidate()
        }
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        return String(format: "0:%02d", seconds)
    }
    
    
    func timerRestart() {
        secondReminder = 61
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
        updateUI()
    }
    
// Используется при выходе с экрана
    override func viewDidDisappear(_: Bool) {
        super.viewDidDisappear(true)
        timer.invalidate()
    }
    
    private func updateUI() {
        scoreLabel.text = "Score is \(score)"
        wordLabel.text = categoryManager?.nextWord
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        score += 1
        updateUI()
        playSound(soundName: "correct")
        timerRestart()

    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        score -= 1
        updateUI()
        playSound(soundName: "incorrect")
        timerRestart()

    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        score = 1
        updateUI()
        playSound(soundName: "resetting")
        timerRestart()

    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        if let urlUnwrapped = url {
            player = try! AVAudioPlayer(contentsOf: urlUnwrapped)
        } else {
            print("Can`t unwrap url")
        }
        player.play()
    }

}
