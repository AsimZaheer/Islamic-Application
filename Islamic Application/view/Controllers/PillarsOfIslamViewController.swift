
import UIKit
import ObjectMapper

class PillarsOfIslamViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var islamicPillarsTableView: UITableView!
    var pillarOfIslam = [PillarsOfIslam]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self.islamicPillarsTableView.register(UINib(nibName: "IslamicPillarsTableViewCell", bundle: nil), forCellReuseIdentifier: "IslamicPillarsTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.islamicPillarsTableView.delegate = self
        self.islamicPillarsTableView.dataSource = self
        self.islamicPillarsTableView.estimatedRowHeight = 350
        self.islamicPillarsTableView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pillarOfIslam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let islamicPillarCell = islamicPillarsTableView.dequeueReusableCell(withIdentifier: "IslamicPillarsTableViewCell", for: indexPath) as! IslamicPillarsTableViewCell
        islamicPillarCell.configureCell(data: pillarOfIslam[indexPath.row])
        return islamicPillarCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "PillarsOfIslam")
        self.pillarOfIslam = Mapper<PillarsOfIslam>().mapArray(JSONObject: json) ?? [PillarsOfIslam]()
    }
}
