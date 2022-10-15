import UIKit
import AVFoundation


class GameViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    var categoryManager: CategoryManager?
    
    private var player: AVAudioPlayer!
    
    private lazy var jokeManager = JokeManager()
    private lazy var wordCouner = 0
    private lazy var actionIndex = 0
    private lazy var score: Int = 0
    private lazy var secondReminder = 60
    private lazy var timer = Timer()
    private lazy var question = ""
    private lazy var answer = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        jokeManager.delegate = self
        jokeManager.fetchData()
        actionIndex = Int.random(in: 1...10)
        startTimer()
        updateUI()
    }
    
    override func viewDidDisappear(_: Bool) {
        super.viewDidDisappear(true)
        timer.invalidate()
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        if wordCouner == actionIndex { score += 2 }
        score += 1
        updateUI()
        playSound(soundName: "correct")
        timerRestart()
        
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        if score <= 0 { score = 0 }
        if wordCouner != actionIndex && score >= 1 { score -= 1 }
        if wordCouner == actionIndex && score <= 0 { score = 0 }
        if wordCouner == actionIndex && score >= 3 { score -= 3 }
        if wordCouner == actionIndex && score == 2 { score -= 2 }
        if wordCouner == actionIndex && score == 1 { score -= 1 }
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
}

// MARK: - JokeManagerDelegate

extension GameViewController: JokeManagerDelegate {
    
    func didGetJoke(jokeModel: JokeModel) {
        DispatchQueue.main.async {
            self.question = jokeModel.text
            self.answer = jokeModel.answer
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - Actions

@objc
private extension GameViewController {
    
    func updateTime() {
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
}

// MARK: - Private Methods

private extension GameViewController {
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        return String(format: "0:%02d", seconds)
    }
    
    
    func timerRestart() {
        secondReminder = 61
    }

    func showAlertButtonPressed(){
        let alert = UIAlertController(title: question, message: answer, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in
            self.navigationController?.popToRootViewController(animated: true)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func finishRound() {
        timer.invalidate()
        showAlertButtonPressed()
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
    
    func updateUI() {
        wordCouner += 1
        scoreLabel.text = "Очки: \(score)"
        
        if wordCouner > 10 {
            wordLabel.text = "КОНЕЦ"
            finishRound()
            return
        }
        wordLabel.text = (wordCouner == actionIndex) ? "ДЕЙСТВИЕ" : categoryManager?.nextWord
    }
}
