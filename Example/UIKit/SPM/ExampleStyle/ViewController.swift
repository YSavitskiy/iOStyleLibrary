
import UIKit
import iOStyleLibrary

class ViewController: UIViewController {

    private enum StyleState {
        case exampleState1
        case exampleState2
    }
    
    @IBOutlet var label: UILabel!
    @IBOutlet var rectView: UIView!
    @IBOutlet var subrectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareStyleStates()
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
                
        self.rectView.stylist.color(.darkGray).cornerRadius(20)
    }
    
    @IBAction func switchToState1(_ sender: UIButton) {
        self.rectView.stylist.state = StyleState.exampleState1
        self.subrectView.stylist.state = StyleState.exampleState1
        self.label.stylist.state = StyleState.exampleState1
    }
    
    @IBAction func switchToState2(_ sender: UIButton) {
        self.rectView.stylist.state = StyleState.exampleState2
        self.subrectView.stylist.state = StyleState.exampleState2
        self.label.stylist.state = StyleState.exampleState2
    }
    
    @IBAction func checkDeinit(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.setViewControllers([vc], animated: true) 
    }
    
    
    private func prepareStyleStates() {
        
        self.rectView.stylist.prepareState(state: StyleState.exampleState1,
                                           style: Style.alpha(0.5) + Style.justView )
                        
        self.rectView.stylist.prepareState(state: StyleState.exampleState2,
                                           action: {  view in
                                                UIView.animate(withDuration: 1) {
                                                    view.alpha = 1
                                                    view.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                                                    view.backgroundColor = .systemYellow
                                                }
                                            })
        
        self.subrectView.stylist.prepareState(state: StyleState.exampleState1,
                                              style: Style.borderView)
        
        self.subrectView.stylist.prepareState(state: StyleState.exampleState2,
                                              style: Style.justView)
        
        self.label.stylist.prepareState(state: StyleState.exampleState1, action: {
            $0.stylist.italicLabelStyle().text("state1")
        })
        
        self.label.stylist.prepareState(state: StyleState.exampleState2, action: {          $0.stylist.boldLabelStyle().text("state2")
        })
        
        
    }
    
    deinit {
        print("deinit passed")
    }
    
}

