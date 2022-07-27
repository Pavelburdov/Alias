//
//  ChoiceViewController.swift
//  Alias
//
//  Created by Pavel on 27.07.2022.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func choiceOne(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChoice", sender: self)
    }

    @IBAction func choiceSecond(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChoice", sender: self)
    }

    @IBAction func choiceThird(_ sender: Any) {
        performSegue(withIdentifier: "goToChoice", sender: self)
    }

    @IBAction func choiceFour(_ sender: Any) {
        performSegue(withIdentifier: "goToChoice", sender: self)
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
