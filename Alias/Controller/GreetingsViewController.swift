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
    }


}

