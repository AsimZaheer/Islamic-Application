
import UIKit

class SurahsNamesTableViewCell: UITableViewCell {
    
    @IBOutlet var quranbackgroundImage: UIImageView!
    @IBOutlet var surahIdLabel: UILabel!
    @IBOutlet var surahNameLabel: UILabel!
    @IBOutlet var surahTransliterationLabel: UILabel!
    @IBOutlet var surahMeaningLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(data : AlQuran){
        surahIdLabel.text = "\(String(describing: data.id!))"
        surahNameLabel.text = data.name ?? ""
        surahTransliterationLabel.text = data.transliteration ?? ""
        surahMeaningLabel.text = "(\(data.transliteration! ))-Verses :\(String(describing: data.total_verses!))"
    }
}
