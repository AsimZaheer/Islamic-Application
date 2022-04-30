
import UIKit

class IslamicPillarsTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var englishTranslationLabel: UILabel!
    @IBOutlet var islamicPillarsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        islamicPillarsView.layer.cornerRadius = 15
        islamicPillarsView.layer.borderWidth = 1
        islamicPillarsView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : PillarsOfIslam) {
        nameLabel.text = data.name
        descriptionLabel.text = data.description
        englishTranslationLabel.text = data.englishTranslation
    }
}
