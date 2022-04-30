
import UIKit
import ObjectMapper

class NamazViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet var namazTableView: UITableView!
    var namaz = [Namaz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self.namazTableView.register(UINib(nibName: "NamazTableViewCell", bundle: nil), forCellReuseIdentifier: "NamazTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.namazTableView.estimatedRowHeight = 350
        self.namazTableView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namaz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let namazCell = namazTableView.dequeueReusableCell(withIdentifier: "NamazTableViewCell", for: indexPath) as! NamazTableViewCell
        namazCell.configureCell(data: namaz[indexPath.row])
        return namazCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "Namaz")
        self.namaz = Mapper<Namaz>().mapArray(JSONObject: json) ?? [Namaz]()
    }
}
