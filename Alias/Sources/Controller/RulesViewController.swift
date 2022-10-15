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
}
