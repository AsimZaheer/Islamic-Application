
import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet var foodView: UIView!
    @IBOutlet var foodTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodView.layer.cornerRadius = 15
        foodView.layer.borderWidth = 1
        foodView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
    }
    
    func configure (data : Food){
        foodTypeLabel.text = data.foodType
        descriptionLabel.text = data.description
    }
}
