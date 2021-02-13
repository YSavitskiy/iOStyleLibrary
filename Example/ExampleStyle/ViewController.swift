
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
        self.label.theme.apply(Theme.boldLabelStyle)
        self.rectView.theme.apply(Theme.borderViewStyle)
        self.subrectView.theme.cornerRadius(30)
        self.subrectView.theme.color(.systemBlue)
    }
    
    @IBAction func applyDifferentStyleAction(_ sender: Any) {
        //use static style
        Theme.normalLabelStyle.apply(to: self.label)
        Theme.justViewStyle.apply(to: self.rectView)
        Theme.borderViewStyle.apply(to: self.subrectView)
    }
        
    @IBAction func applyChainStyle(_ sender: Any) {
        self.label.theme
            .fontSize(22)
            .text("newText")
            .textColor(.systemRed)
        self.rectView.theme
            .cornerRadius(11)
            .color(.lightGray)
        Theme.justViewStyle
            .apply(to: self.subrectView)
            .color(.black)
        
    }
    
    @IBAction func applyConcatenation(_ sender: Any) {
        let newLabelStyle = Theme.boldLabelStyle + Theme.purpleLabelStyle
        self.label.theme.apply(newLabelStyle)
        
        //self.label.theme + self.label.theme.italicLabelStyle  Theme.italicLabelStyle.styling
        
        
        //var e = Theme.boldLabelStyle.styling + Theme.magentaLabelStyle.styling
        //self.label.theme.apply(ThemeStyle(e))
        
        
        //var d = self.label.theme.fontSize(3.0) + self.label.theme.color(.black)
        
        
        //var d = self.label.theme.fontSize(2) + Theme.magentaLabelStyle
        
        
        //var r = Theme.boldLabelStyle.styling + Theme.magentaLabelStyle.styling
        //self.label.theme.color(.magenta) + self.label.theme.fontSize(10)
        
        
        
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

