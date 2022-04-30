
import UIKit

class TotalZakatViewController: UIViewController {
    
    @IBOutlet var totalZakatAmountLabel: UILabel!
    var totalZakatAmount : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalZakatAmountLabel.text =  String(totalZakatAmount!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func okayButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButtonTotalZakat(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
