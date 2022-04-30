
import UIKit

class DuasNameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var duasNameLabel: UILabel!
    @IBOutlet var duasNameView: UIView!
    @IBOutlet var duasImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        duasNameView.layer.cornerRadius = 15
        duasNameView.layer.borderWidth = 1
        duasNameView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell (data : IslamicDuas) {
        duasNameLabel.text = data.azkarName
        duasImage.image = UIImage(named: data.image ?? "")
    }
}
