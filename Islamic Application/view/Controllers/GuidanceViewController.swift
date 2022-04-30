
import UIKit

class GuidanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self._navigationBarSetUp()
    }
    
    @IBAction func hajjGuidanceButton(_ sender: UIButton) {
        self._navigateController(storyboardName: "IslamicViews", viewController: "HajjViewController")
    }
    
    @IBAction func umrahGuidanceButton(_ sender: UIButton) {
        self._navigateController(storyboardName: "IslamicViews", viewController: "UmrahViewController")
    }
}
