
import iOStyleLibrary

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rectView: UIView!
    @IBOutlet weak var subrectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
    }
    
    @IBAction func applyStyleAction(_ sender: Any) {
        //use object style
        self.rectView.stylist.apply(Style.borderView)
        self.label.stylist.boldLabelStyle()
        self.subrectView.stylist.cornerRadius(30)
        self.subrectView.stylist.color(.systemBlue)
    }
    
    @IBAction func applyDifferentStyleAction(_ sender: Any) {
        //use static style
        Style.normalLabel.apply(to: self.label)
        Style.justView.apply(to: self.rectView)
        Style.borderView.apply(to: self.subrectView)
    }
        
    @IBAction func applyChainStyle(_ sender: Any) {
        self.label.stylist
            .fontSize(22)
            .text("newText")
            .textColor(.systemRed)
        self.rectView.stylist
            .cornerRadius(11)
            .color(.lightGray)
        Style.justView
            .apply(to: self.subrectView)
            .color(.black)
    }
    
    @IBAction func applyConcatenation(_ sender: Any) {
        let newLabelStyle = Style.boldLabel + Style.purpleLabel + Style.italicLabel
        self.label.stylist.apply(newLabelStyle)
        
        self.subrectView.stylist.color(.systemYellow) + self.subrectView.stylist.cornerRadius(0) //There's very little point in doing that concatination, but you can
        
        self.rectView.stylist.color(.black).cornerRadius(20)
    }
    
    @IBAction func checkDeinit(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.setViewControllers([vc], animated: true) 
    }
    
    deinit {
        print("deinit passed")
    }
    
}

