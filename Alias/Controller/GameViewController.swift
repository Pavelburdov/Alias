//
//  GameViewController.swift
//  Alias
//
//  Created by Pavel on 28.07.2022.
//

import UIKit

class GameViewController: UIViewController {


    var secondReminder = 60
    var timer = Timer()

    @IBOutlet weak var secondLabel: UILabel!

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
//        print(timeFormatted(secondReminder))
        if secondReminder != 0 {
            secondReminder -= 1
//            DispatchQueue.main.async {
//                self.secondLabel.text = String(format: "0%.1f", self.secondReminder)
//            }
        } else {
            endTimer()
        }


    func endTimer() {
        timer.invalidate()
        
    }
    }
    

//    func timeFormatted(_ totalSeconds: Int) -> String {
//        let seconds: Int = totalSeconds % 60
//        return String(format: "0:%02d", seconds)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
        // Do any additional setup after loading the view.
    }
    
    

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
