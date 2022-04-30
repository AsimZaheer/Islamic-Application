
import UIKit

class TasbeehViewController: UIViewController  {
    
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    var counterValue : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.layer.cornerRadius = 10
        resetButton.layer.borderWidth = 2
        resetButton.layer.borderColor = #colorLiteral(red: 0.4, green: 0.1529411765, blue: 0.7764705882, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        let count =  UserDefaults.standard.value(forKey: "counter")
        if count !=  nil {
            counterValue = count as! Int
            counterLabel.text = "\(counterValue)"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func countButton(_ sender: Any) {
        counterValue += 1
        counterLabel.text = "\(counterValue)"
        UserDefaults.standard.set(counterValue, forKey: "counter")
    }
    
    @IBAction func resetCounterButton(_ sender: Any) {
        counterValue = 0
        counterLabel.text = "\(counterValue)"
        UserDefaults.standard.set(counterValue, forKey: "counter")
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
