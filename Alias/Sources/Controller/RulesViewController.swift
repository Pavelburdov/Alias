//
//  RulesViewController.swift
//  Alias
//
//  Created by Pavel on 27.07.2022.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var rulesText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        rulesText.text = """
        \(Rules.mainTitle)
        \(Rules.main)\n
        \(Rules.explanationTitle)
        \(Rules.explanation)\n
        \(Rules.scoreTitle)
        \(Rules.score)\n
        \(Rules.controlTitle)
        \(Rules.control)
        """
        
        rulesText.isEditable = false

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
