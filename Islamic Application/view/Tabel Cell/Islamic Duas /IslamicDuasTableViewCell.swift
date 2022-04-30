
import UIKit

class IslamicDuasTableViewCell: UITableViewCell {
    
    @IBOutlet var englishTranslation: UILabel!
    @IBOutlet var urduTranslation: UILabel!
    @IBOutlet var arabic: UILabel!
    @IBOutlet var islamicDuasView: UIView!
    @IBOutlet var duasTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        islamicDuasView.layer.cornerRadius = 15
        islamicDuasView.layer.borderWidth = 1
        islamicDuasView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : Azkar){
        duasTitle.text = data.duaTitle
        arabic.text = data.arabic
        urduTranslation.text = data.urduTranslation
        englishTranslation.text = data.englishTranslaton
    }
}
