
import UIKit

class AlQuranTableViewCell: UITableViewCell {
    
    @IBOutlet var ayyatNoLabel: UILabel!
    @IBOutlet var quranMainView: UIView!
    @IBOutlet var englishTranslationLabel: UILabel!
    @IBOutlet var urduTranslationLabel: UILabel!
    @IBOutlet var quranArabicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        quranMainView.layer.cornerRadius = 15
        quranMainView.layer.borderWidth = 1
        quranMainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : Verse , quranPakUrdu : Verse ){
        ayyatNoLabel.text = "\(String(describing: data.id!))"
        englishTranslationLabel.text = data.translation ?? ""
        quranArabicLabel.text = data.text ?? ""
        urduTranslationLabel.text = quranPakUrdu.translation ?? "" 
    }
}
