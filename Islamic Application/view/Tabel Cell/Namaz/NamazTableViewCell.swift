
import UIKit

class NamazTableViewCell: UITableViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var arabicImage: UIImageView!
    @IBOutlet var namazStepLabel: UILabel!
    @IBOutlet var namazDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configureCell(data : Namaz)
    {
        namazStepLabel.text = data.step
        namazDetailLabel.text = data.detail
        arabicImage.image = UIImage(named: data.image ?? "")
    }
}
