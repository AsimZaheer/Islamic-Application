
import UIKit

class UmrahTableViewCell: UITableViewCell {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func  configureCell(data: Umrah){
        dayLabel.text = data.day
        detailLabel.text = data.detail
    }
}
