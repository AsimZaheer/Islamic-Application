
import UIKit
import AVFoundation
import ObjectMapper

class KalmasViewController: UIViewController ,  UITableViewDelegate, UITableViewDataSource  , AVAudioPlayerDelegate {
    
    @IBOutlet var kalmasTabelView: UITableView!
    var collapsTableCell : [Int : Bool] = [:]
    var kalmas = [Kalmas]()
    var player: AVAudioPlayer?
    var playAudio  = false
    var currentIndex : Int?
    var currentAudio : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kalmasTabelView.register(UINib(nibName: "KalmasTableViewCell", bundle: nil), forCellReuseIdentifier: "KalmasTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        jsonMapping()
        self.kalmasTabelView.delegate = self
        self.kalmasTabelView.dataSource = self
        self.kalmasTabelView.estimatedRowHeight = 350
        self.kalmasTabelView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.stop()
        player?.currentTime = 0.0
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "kalmas")
        self.kalmas = Mapper<Kalmas>().mapArray(JSONObject: json) ?? [Kalmas]()
    }
    
    func playSound(audioName: String ) {
        guard let url = Bundle.main.url(forResource: audioName, withExtension: "mp3") else {
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.delegate = self
            player!.play()
            currentAudio = audioName
        } catch _ as NSError {
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.currentIndex = nil
        self.kalmasTabelView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kalmas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kalamsCell = self.kalmasTabelView.dequeueReusableCell(withIdentifier: "KalmasTableViewCell", for: indexPath) as! KalmasTableViewCell
        kalamsCell.configureCell(data: kalmas[indexPath.row])
        let indexPath = indexPath.row
        if  currentIndex == indexPath {
            kalamsCell.AudioPlayButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            kalamsCell.AudioPlayButton.tintColor = .white
        }
        else{
            kalamsCell.AudioPlayButton.setImage(UIImage(named: "play-button-arrowhead 1"), for: .normal)
        }
        kalamsCell.playKalmasAudio  = { (kalmaAudio) in
            if  self.playAudio && kalmaAudio == self.currentAudio {
                self.player?.stop()
                self.currentIndex = nil
                kalamsCell.AudioPlayButton.setImage(UIImage(named: "play-button-arrowhead 1"), for: .normal)
                self.playAudio = false
            }
            else{
                self.playSound(audioName: kalmaAudio)
                kalamsCell.AudioPlayButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                kalamsCell.AudioPlayButton.tintColor = .black
                self.playAudio = true
                self.currentIndex = indexPath
                self.kalmasTabelView.reloadData()
            }
        }
        if self.collapsTableCell[indexPath] ?? false {
            kalamsCell.detailView.isHidden = false
            kalamsCell.setupTable()
        } else {
            kalamsCell.setupTabelCell()
            kalamsCell.detailView.isHidden = true
        }
        return kalamsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if self.collapsTableCell[index] ?? false {
            self.collapsTableCell[index] = false
        } else {
            self.collapsTableCell[index] = true
        }
        self.kalmasTabelView.reloadData()
    }
}
