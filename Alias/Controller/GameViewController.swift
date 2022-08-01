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
    var wordCouner = 0
    var actionIndex = 0
    
    var jokeManager = JokeManager()
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        if secondReminder != 0 {
            secondReminder -= 1
            secondLabel.text = "\(secondReminder)"
        } else {
            endTimer()
        }

        func endTimer() {
            timerRestart()
            updateUI()
            score -= 1
        }
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        return String(format: "0:%02d", seconds)
    }
    
    
    func timerRestart() {
        secondReminder = 61
    }

    // create the alert
    private func showAlertButtonPressed(){
        let alert = UIAlertController(title: "ВНИМАНИЕ", message: "Ваш игра закончилась", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in
            self.jokeManager.fetchData()
        })
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jokeManager.delegate = self
        actionIndex = Int.random(in: 1...10)
        startTimer()
        updateUI()
    }
    
    // Используется при выходе с экрана
    override func viewDidDisappear(_: Bool) {
        super.viewDidDisappear(true)
        timer.invalidate()
    }
    
    private func updateUI() {
        
        wordCouner += 1
        scoreLabel.text = "Очки: \(score)"
        
        if wordCouner > 10 {
            wordLabel.text = "КОНЕЦ"
            finishRound()
            return
        }
        wordLabel.text = (wordCouner == actionIndex) ? "ДЕЙСТВИЕ" : categoryManager?.nextWord
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        if wordCouner == actionIndex { score += 2 }
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
        score = 0
        wordCouner = 0
        actionIndex = Int.random(in: 1...10)
        updateUI()
        playSound(soundName: "resetting")
        timerRestart()
    }
    
    private func finishRound() {
        
        timer.invalidate()
        showAlertButtonPressed()
//        self.jokeManager.fetchData()
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

extension GameViewController: JokeManagerDelegate {
    func didGetJoke(jokeModel: JokeModel) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: jokeModel.text, message: jokeModel.answer, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
