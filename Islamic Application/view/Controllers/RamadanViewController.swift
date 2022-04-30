
import UIKit
import ObjectMapper

class RamadanViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var ramadanTableView: UITableView!
    var ramadanData  = [Ramadan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self.ramadanTableView.register(UINib(nibName: "RamadanTableViewCell", bundle: nil), forCellReuseIdentifier: "RamadanTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.ramadanTableView.delegate = self
        self.ramadanTableView.dataSource = self
        self.ramadanTableView.estimatedRowHeight = 350
        self.ramadanTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ramadanData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ramadanCell = ramadanTableView.dequeueReusableCell(withIdentifier: "RamadanTableViewCell", for: indexPath) as! RamadanTableViewCell
        ramadanCell.configureCell(data: ramadanData[indexPath.row])
        return ramadanCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "Ramadan")
        self.ramadanData = Mapper<Ramadan>().mapArray(JSONObject: json) ?? [Ramadan]()
    }
}
