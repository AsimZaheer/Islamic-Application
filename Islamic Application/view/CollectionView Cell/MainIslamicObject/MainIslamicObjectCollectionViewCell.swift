
import UIKit

class MainIslamicObjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var objectView: UIView!
    @IBOutlet var bakgroundframe: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        objectView.layer.cornerRadius = 10
    }
    
    func configureCell(data : IslamicObject){
        objectView.backgroundColor = UIColor(patternImage: UIImage(named: data.backgroundColor ?? "") ?? UIImage())
        bakgroundframe.image = UIImage(named: data.backgroundFrame ?? "")
        nameLabel.text = data.name
        imageIcon.image = UIImage(named: data.imageIcon ?? "")
    }
}
