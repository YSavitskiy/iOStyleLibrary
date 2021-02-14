
import iOStyleLibrary

class ViewController: UIViewController {

    private enum SceneState {
        case state1
        case state2
    }
    
    @IBOutlet var label: UILabel!
    @IBOutlet var rectView: UIView!
    @IBOutlet var subrectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
    }
    
    @IBAction func applyStyleAction(_ sender: UIButton) {
        //use object style
        self.rectView.stylist.apply(Style.borderView)
        self.label.stylist.boldLabelStyle()
        self.subrectView.stylist.cornerRadius(30)
        self.subrectView.stylist.color(.systemBlue)
    }
    
    @IBAction func applyDifferentStyleAction(_ sender: UIButton) {
        //use static style
        Style.normalLabel.apply(to: self.label)
        Style.justView.apply(to: self.rectView)
        Style.borderView.apply(to: self.subrectView)
    }
        
    @IBAction func applyChainStyle(_ sender: UIButton) {
        
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
    
    @IBAction func applyConcatenation(_ sender: UIButton) {
        let newLabelStyle = Style.boldLabel + Style.purpleLabel + Style.italicLabel
        self.label.stylist.apply(newLabelStyle) //or newLabelStyle.apply(to: self.label)
                
        self.rectView.stylist.color(.black).cornerRadius(20)
    }
    
    
    
    @IBAction func switchToState1(_ sender: UIButton) {
                        
        self.view.stylist.state = SceneState.state1
    }
    
    @IBAction func switchToState2(_ sender: UIButton) {
        
    }
    
    @IBAction func checkDeinit(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.setViewControllers([vc], animated: true) 
    }
    
    deinit {
        print("deinit passed")
    }
    
}

