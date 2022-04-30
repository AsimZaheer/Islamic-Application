
import UIKit
import AVFoundation

class KalmasTableViewCell: UITableViewCell {
    
    @IBOutlet var AudioPlayButton: UIButton!
    @IBOutlet var detailView: UIView!
    @IBOutlet var kalmaNameaLabel: UILabel!
    @IBOutlet var HeightConstraintsKalmaNameView: NSLayoutConstraint!
    @IBOutlet var arabicLabel: UILabel!
    @IBOutlet var kalmaNamesView: UIView!
    @IBOutlet var kalmasStackView: UIStackView!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var kalmasMainView: UIView!
    @IBOutlet var englishTranslationLabel: UILabel!
    @IBOutlet var kalmasNameBackgroundImage: UIImageView!
    @IBOutlet var kalmasNameView: UIView!
    @IBOutlet var arrowButton: UIButton!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var kalmaNumberLabel: UILabel!
    var  playKalmasAudio : ((String) -> Void)?
    var audioName : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        kalmasMainView.layer.cornerRadius = 15
        kalmasMainView.layer.borderWidth = 1
        kalmasMainView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
        kalmaNamesView.layer.cornerRadius = 15
        arrowButton.setBackgroundImage(#imageLiteral(resourceName: "arrow-down-sign-to-navigate 1"), for: .normal)
    }
    
    func configureCell(data : Kalmas ){
        kalmaNameaLabel.text = data.kalmaName
        for kalmaData in data.data! {
            kalmaNumberLabel.text = kalmaData.kalmaNumber
            arabicLabel.text = kalmaData.arabic
            meaningLabel.text = kalmaData.meaning
            englishTranslationLabel.text = kalmaData.englishMeaning
            audioName = kalmaData.audio
        }
    }
    
    func setupTabelCell(){
        kalmasNameBackgroundImage.image = .none
        arrowButton.setBackgroundImage(#imageLiteral(resourceName: "arrow-down-sign-to-navigate 1"), for: .normal)
        iconImage.image = #imageLiteral(resourceName: "Vector")
        HeightConstraintsKalmaNameView.constant = 60
        kalmaNumberLabel.textColor = #colorLiteral(red: 0.4274509804, green: 0.1725490196, blue: 0.7921568627, alpha: 1)
    }
    
    func setupTable(){
        kalmasNameBackgroundImage.image = #imageLiteral(resourceName: "Rectangle 3")
        arrowButton.setBackgroundImage(#imageLiteral(resourceName: "arrow-down-sign-to-navigate (1) 1"), for: .normal)
        iconImage.image = #imageLiteral(resourceName: "Vector-9")
        kalmaNumberLabel.textColor = .white
        HeightConstraintsKalmaNameView.constant = 55
    }
    
    @IBAction func playKalmasAudioButton(_ sender: Any) {
        playKalmasAudio?(audioName ?? "")
    }
}
