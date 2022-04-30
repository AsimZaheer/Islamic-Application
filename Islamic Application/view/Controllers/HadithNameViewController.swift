
import UIKit
import  ObjectMapper

class HadithNameViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet var hadithTabelView: UITableView!
    var hadithName = [HadithName]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._navigationBarSetUp()
        jsonMapping()
        self.hadithTabelView.register(UINib(nibName: "HadithNameTableViewCell", bundle: nil), forCellReuseIdentifier: "HadithNameTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hadithName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hadithCell = hadithTabelView.dequeueReusableCell(withIdentifier: "HadithNameTableViewCell", for: indexPath) as! HadithNameTableViewCell
        hadithCell.configureCell(data: hadithName[indexPath.row])
        return hadithCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let IslamicViewsStroyboard = UIStoryboard(name: "IslamicViews", bundle: nil)
        let hadithController = IslamicViewsStroyboard.instantiateViewController(withIdentifier: "HadithViewController") as! HadithViewController
        hadithController.hadith =  hadithName[indexPath.row].data ?? [HadithDetail]()
        hadithController.navigationTitle =  hadithName[indexPath.row].name ?? ""
        self.navigationController?.pushViewController(hadithController, animated: true)
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "Hadith")
        self.hadithName = Mapper<HadithName>().mapArray(JSONObject: json) ?? [HadithName]()
    }
}
