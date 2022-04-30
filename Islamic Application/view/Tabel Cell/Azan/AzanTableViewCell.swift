
import UIKit

class AzanTableViewCell: UITableViewCell {
    
    @IBOutlet var azanStopButton: UIButton!
    @IBOutlet var azanPlayButton: UIButton!
    @IBOutlet var azanNameLabel: UILabel!
    var azanAudioName : String?
    var  playAzanAudio : ((String) -> Void)?
    var  stopAzanAudio : ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        azanPlayButton.setBackgroundImage(UIImage(named: "AzanPlayButtonImage"), for: .normal)
    }
    
    func configureCell (data : Azan){
        azanNameLabel.text = data.azanName
        azanAudioName = data.azanSound
    }
    
    @IBAction func azanPlayButton(_ sender: UIButton) {
        playAzanAudio?(azanAudioName ?? "")
    }
    
    @IBAction func azanStopButton(_ sender: UIButton) {
        stopAzanAudio?(azanAudioName ?? "")
    }
}
