
import UIKit

class ZakatViewController: UIViewController {
    
    @IBOutlet var totalAmountTextField: UITextField!
    @IBOutlet var goldQuantityTextField: UITextField!
    @IBOutlet var currentGoldRateTextField: UITextField!
    @IBOutlet var calculateZakatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        totalAmountTextField.text = ""
        goldQuantityTextField.text = ""
        currentGoldRateTextField.text = ""
    }
    
    func alertController( message : String){
        let alert = UIAlertController(title: "Alert", message: message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func calculateZakatButton(_ sender: UIButton) {
        if  goldQuantityTextField.text != "" || totalAmountTextField.text != "" {
            let goldQuantity = Double("\(String(describing: goldQuantityTextField.text!))") ?? 0.0
            if  goldQuantity  < 7.5 {
                alertController( message: "Enter Gold Quantity greater than 7.5")
            }else{
                let currentGoldRate = Double("\(String(describing: currentGoldRateTextField.text!))") ?? 0.0
                let totalAmount = Double("\(String(describing: totalAmountTextField.text!))") ?? 0.0
                let totalZakatAmount =  (((currentGoldRate * goldQuantity) + totalAmount) * 0.025)
                let totalZakatViewController = self.storyboard?.instantiateViewController(withIdentifier: "TotalZakatViewController") as! TotalZakatViewController
                totalZakatViewController.totalZakatAmount = totalZakatAmount
                self.navigationController?.pushViewController(totalZakatViewController, animated: true)
            }
        }
        else{
            alertController(message: "Please Fill Out At Least Two Fields")
        }
    }
    
    @IBAction func backButtonZakatCalculator(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
