import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func applyStyleAction(_ sender: Any) {
        self.label.theme.apply(Theme.boldLabelStyle)
        self.rectView.theme.apply(Theme.borderViewStyle)
    }
    
    @IBAction func applyDifferentStyleAction(_ sender: Any) {
        //or
        Theme.normalLabelStyle.apply(to: self.label)
        Theme.justViewStyle.apply(to: self.rectView)
    }
    
    
    @IBAction func applyChainStyle(_ sender: Any) {
    }
    
}

