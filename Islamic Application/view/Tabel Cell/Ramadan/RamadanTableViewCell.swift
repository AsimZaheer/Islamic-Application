
import UIKit

class RamadanTableViewCell: UITableViewCell {
    
    @IBOutlet var ramadanMainView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ramadanMainView.layer.cornerRadius = 15
        ramadanMainView.layer.borderWidth = 1
        ramadanMainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell( data : Ramadan ){
        titleLabel.text =  data.title
        detailLabel.text = data.detail
    }
}
