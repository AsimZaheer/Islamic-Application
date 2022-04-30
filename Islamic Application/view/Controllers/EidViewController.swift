
import UIKit
import ObjectMapper

class EidViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet var eidTableView: UITableView!
    var eid = [Eid]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self.eidTableView.register(UINib(nibName: "EidTableViewCell", bundle: nil), forCellReuseIdentifier: "EidTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.eidTableView.delegate = self
        self.eidTableView.dataSource = self
        self.eidTableView.estimatedRowHeight = 350
        self.eidTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eid.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eidCell = eidTableView.dequeueReusableCell(withIdentifier: "EidTableViewCell", for: indexPath) as! EidTableViewCell
        eidCell.configureCell(data: eid[indexPath.row])
        return eidCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "Eid")
        self.eid = Mapper<Eid>().mapArray(JSONObject: json) ?? [Eid]()
    }
}
