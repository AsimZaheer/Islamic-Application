
import UIKit

class WuduTableViewCell: UITableViewCell {
    
    @IBOutlet var wuduMainView: UIView!
    @IBOutlet var wuduStepsLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wuduMainView.layer.cornerRadius = 15
        wuduMainView.layer.borderWidth = 1
        wuduMainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : Wudu){
        wuduStepsLabel.text = data.stepNo
        detailLabel.text = data.detail
    }
}
