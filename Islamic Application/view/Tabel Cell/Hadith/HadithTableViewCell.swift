
import UIKit

class HadithTableViewCell: UITableViewCell {
    
    @IBOutlet var arabicLabel: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet var urduTranslationLabel: UILabel!
    @IBOutlet var englishLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : HadithDetail) -> Void {
        arabicLabel.text = data.arabic
        englishLabel.text  = data.englishTranslation
        urduTranslationLabel.text = data.urduTranslation
    }
}
