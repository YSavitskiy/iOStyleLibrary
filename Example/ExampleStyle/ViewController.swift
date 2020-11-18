import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func applyStyleAction(_ sender: Any) {
        Theme.boldLabelStyle.apply(to: self.label)
        Theme.borderViewStyle.apply(to: self.rectView)
    }
    
    @IBAction func applyDifferentStyleAction(_ sender: Any) {
        Theme.normalLabelStyle.apply(to: self.label)
        Theme.justViewStyle.apply(to: self.rectView)
    }
    
    
}

