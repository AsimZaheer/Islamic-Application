
import UIKit

class QiblaViewController: UIViewController {
    
    @IBOutlet var compassView: UIView!
    @IBOutlet var compassImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rotateButton(_ sender: Any) {
        compassView.transform = compassView.transform.rotated(by: .pi)
    }
}
