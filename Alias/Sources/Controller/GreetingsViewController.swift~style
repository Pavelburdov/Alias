import UIKit

class GreetingsViewController: UIViewController {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var readRulesButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLogo.image = #imageLiteral(resourceName: "pict1")
    }
    
    @IBAction func playGameButtonPressed(_ sender: UIButton) {

        performSegue(withIdentifier: "goToGames", sender: self)
    }

    @IBAction func rulesButtonPressed(_ sender: UIButton) {

        performSegue(withIdentifier: "goToRules", sender: self)
    }
}

