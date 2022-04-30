
import UIKit
import ObjectMapper

class HajjViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var hajjTabelView: UITableView!
    var hajj = [Hajj]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self.hajjTabelView.register(UINib(nibName: "HajjTableViewCell", bundle: nil), forCellReuseIdentifier: "HajjTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.hajjTabelView.estimatedRowHeight = 350
        self.hajjTabelView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hajj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hajjCell = hajjTabelView.dequeueReusableCell(withIdentifier: "HajjTableViewCell", for: indexPath) as! HajjTableViewCell
        hajjCell.configureCell(data: hajj[indexPath.row])
        return hajjCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "Hajj")
        self.hajj = Mapper<Hajj>().mapArray(JSONObject: json) ?? [Hajj]()
    }
}
