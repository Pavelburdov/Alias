//
//  ChoiceViewController.swift
//  Alias
//
//  Created by Pavel on 27.07.2022.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func choiceOne(_ sender: UIButton) {
        self.category = Category.categories[0]
        performSegue(withIdentifier: "goToChoice", sender: self)
    }

    @IBAction func choiceSecond(_ sender: UIButton) {
        self.category = Category.categories[1]
        performSegue(withIdentifier: "goToChoice", sender: self)
    }

    @IBAction func choiceThird(_ sender: Any) {
        self.category = Category.categories[2]
        performSegue(withIdentifier: "goToChoice", sender: self)
    }

    @IBAction func choiceFour(_ sender: Any) {
        self.category = Category.categories[3]
        performSegue(withIdentifier: "goToChoice", sender: self)
    }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "goToChoice" else { return }
            guard let destinationVC = segue.destination as? GameViewController else { return }
            guard let category = category else { return }
            destinationVC.categoryManager = CategoryManager(category: category)
            print(category.title)
        }
}

