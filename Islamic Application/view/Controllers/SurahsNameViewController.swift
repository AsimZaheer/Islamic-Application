
import UIKit
import ObjectMapper

class SurahsNameViewController: UIViewController , UITableViewDataSource  , UITableViewDelegate {
    
    @IBOutlet var surahsNameTableView: UITableView!
    var quran = [AlQuran]()
    var quranPakUrdu = [AlQuran]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._navigationBarSetUp()
        self.jsonMapping(jsonFile: "QuranPak")
        self.jsonMapping(jsonFile: "QuranPakUrdu")
        self.surahsNameTableView.register(UINib(nibName: "SurahsNamesTableViewCell", bundle: nil), forCellReuseIdentifier: "SurahsNamesTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quran.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let surahNameCell = surahsNameTableView.dequeueReusableCell(withIdentifier: "SurahsNamesTableViewCell", for: indexPath) as! SurahsNamesTableViewCell
        surahNameCell.configureCell(data: quran[indexPath.row])
        return surahNameCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let Storyboard = UIStoryboard(name: "IslamicItems", bundle: nil)
        let quranController =  Storyboard.instantiateViewController(withIdentifier: "QuranViewController") as! QuranViewController
        quranController.quranPak = quran[indexPath.row].verse ?? []
        quranController.quranPakUrdu = quranPakUrdu[indexPath.row].verse ?? []
        quranController.navigationTitle = quranPakUrdu[indexPath.row].transliteration ?? ""
        self.navigationController?.pushViewController(quranController, animated: true)
    }
    
    func jsonMapping(jsonFile : String){
        if jsonFile == "QuranPak"{
            let json  = self.readJsonFile(fileName: jsonFile)
            self.quran = Mapper<AlQuran>().mapArray(JSONObject: json) ?? [AlQuran]()
        }else{
            let json  = self.readJsonFile(fileName: jsonFile)
            self.quranPakUrdu = Mapper<AlQuran>().mapArray(JSONObject: json) ?? [AlQuran]()
        }
    }
}
