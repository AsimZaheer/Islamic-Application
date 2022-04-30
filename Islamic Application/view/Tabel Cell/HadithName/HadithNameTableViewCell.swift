
import UIKit

class HadithNameTableViewCell: UITableViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var hadithNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : HadithName ) {
        hadithNameLabel.text  = data.name
    }
}
