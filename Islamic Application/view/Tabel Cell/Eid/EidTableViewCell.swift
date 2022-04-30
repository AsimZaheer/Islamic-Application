
import UIKit

class EidTableViewCell: UITableViewCell {
    
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var eidMainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eidMainView.layer.cornerRadius = 15
        eidMainView.layer.borderWidth = 1
        eidMainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : Eid){
        titleLabel.text = data.title
        detailLabel.text = data.detail
    }
}
