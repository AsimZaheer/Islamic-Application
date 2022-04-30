
import UIKit
import ObjectMapper
import AVFoundation

class AzanViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, AVAudioPlayerDelegate {
    
    @IBOutlet var azanTableView: UITableView!
    var azan =  [Azan]()
    var player : AVAudioPlayer?
    var currentAudioName : String?
    var pauseAudio  = false
    var audioButtonIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self._navigationBarSetUp()
        self.azanTableView.register(UINib(nibName: "AzanTableViewCell", bundle: nil), forCellReuseIdentifier: "AzanTableViewCell") 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.stop()
        player?.currentTime = 0.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        azan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let azanCell = azanTableView.dequeueReusableCell(withIdentifier: "AzanTableViewCell", for: indexPath) as! AzanTableViewCell
        azanCell.configureCell(data: azan[indexPath.row])
        let index = indexPath.row
        if  audioButtonIndex == index {
            azanCell.azanPlayButton.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
            azanCell.azanPlayButton.tintColor = .black
        }
        else{
            azanCell.azanPlayButton.setBackgroundImage(UIImage(named: "AzanPlayButtonImage"), for: .normal)
        }
        azanCell.playAzanAudio  = { (azanAudio) in
            if  self.pauseAudio == true &&  azanAudio == self.currentAudioName {
                self.audioButtonIndex = -1
                self.pauseSound(audioName: azanAudio)
            }
            else{
                self.playSound(audioName: azanAudio)
                self.audioButtonIndex = index
                self.azanTableView.reloadData()
            }
        }
        azanCell.stopAzanAudio = { (azanAudio) in
            self.stopSound(audioName: azanAudio)
            self.audioButtonIndex = -1
        }
        return azanCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "Azan")
        self.azan = Mapper<Azan>().mapArray(JSONObject: json) ?? [Azan]()
    }
    
    func stopSound(audioName : String){
        if audioName == currentAudioName{
            self.azanTableView.reloadData()
            player?.stop()
            self.pauseAudio = false
            player?.currentTime = 0.0
        }
    }
    
    func pauseSound(audioName : String){
        self.azanTableView.reloadData()
        self.pauseAudio = false
        player?.pause()
    }
    
    func playSound( audioName : String) {
        if player != nil && audioName == self.currentAudioName {
            player?.play()
            self.pauseAudio = true
        }
        else{
            guard let url = Bundle.main.url(forResource: audioName, withExtension: "mp3") else {
                return
            }
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                player?.delegate = self
                player!.play()
                self.currentAudioName = audioName
                self.pauseAudio = true
            } catch  _ as NSError {
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.audioButtonIndex = nil
        self.azanTableView.reloadData()
    }
}

