import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        button.layer.cornerRadius = 5
    }

}

