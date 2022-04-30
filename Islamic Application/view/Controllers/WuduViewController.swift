
import UIKit
import ObjectMapper

class WuduViewController: UIViewController  , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet var wuduTableView: UITableView!
    var wudu = [Wudu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self.wuduTableView.register(UINib(nibName: "WuduTableViewCell", bundle: nil), forCellReuseIdentifier: "WuduTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.wuduTableView.delegate = self
        self.wuduTableView.dataSource = self
        self.wuduTableView.estimatedRowHeight = 350
        self.wuduTableView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wudu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wuduCell = wuduTableView.dequeueReusableCell(withIdentifier: "WuduTableViewCell", for: indexPath) as! WuduTableViewCell
        wuduCell.configureCell(data: wudu[indexPath.row])
        return wuduCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "wudu")
        self.wudu = Mapper<Wudu>().mapArray(JSONObject: json) ?? [Wudu]()
    }
}
