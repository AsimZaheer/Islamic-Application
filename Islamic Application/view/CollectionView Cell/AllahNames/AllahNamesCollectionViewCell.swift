
import UIKit

class AllahNamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var transliterationLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
         super.awakeFromNib()
    }
    
    func configureCell(data : AllahNames ){
        numberLabel.text = data.number
        transliterationLabel.text = data.transliteration
        meaningLabel.text = data.meaning
        nameLabel.text = data.name
    }
}
