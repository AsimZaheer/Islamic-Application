
import UIKit
import ObjectMapper

class UmrahViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet var umrahTableView: UITableView!
    var umrah = [Umrah]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self.umrahTableView.register(UINib(nibName: "UmrahTableViewCell", bundle: nil), forCellReuseIdentifier: "UmrahTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.umrahTableView.estimatedRowHeight = 350
        self.umrahTableView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return umrah.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let umrahCell = umrahTableView.dequeueReusableCell(withIdentifier: "UmrahTableViewCell", for: indexPath) as! UmrahTableViewCell
        umrahCell.configureCell(data: umrah[indexPath.row])
        return umrahCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "Umrah")
        self.umrah = Mapper<Umrah>().mapArray(JSONObject: json) ?? [Umrah]()
    }
}
