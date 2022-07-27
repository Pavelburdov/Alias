//
//  ViewController.swift
//  Alias
//
//  Created by Nikita Rekaev on 26.07.2022.
//

import UIKit

class GreetingsViewController: UIViewController {


    @IBOutlet weak var aliasGame: UITextView!

    @IBOutlet weak var imageLogo: UIImageView!

    @IBOutlet weak var newGameButton: UIButton!

    @IBOutlet weak var readRulesButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        aliasGame.text = "Alias"
        imageLogo.image = #imageLiteral(resourceName: "pict1")
    }

    @IBAction func playGameButtonPressed(_ sender: UIButton) {

        performSegue(withIdentifier: "goToGames", sender: self)
    }

    @IBAction func rulesButtonPressed(_ sender: UIButton) {

        performSegue(withIdentifier: "goToRules", sender: self)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToRules" {
//            let destinationVC = segue.destination as! RulesViewController
//            destinationVC.rules =
//
//        }
//    }
}

