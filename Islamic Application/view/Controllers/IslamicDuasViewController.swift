
import UIKit

class IslamicDuasViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet var islamicDuasTableView: UITableView!
    var azkar =  [Azkar]()
    var navigationTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        islamicDuasTableView.register(UINib(nibName: "IslamicDuasTableViewCell", bundle: nil), forCellReuseIdentifier: "IslamicDuasTableViewCell")
        self.islamicDuasTableView.dataSource = self
        self.islamicDuasTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.navigationItem.title = navigationTitle
        self.islamicDuasTableView.estimatedRowHeight = 350
        self.islamicDuasTableView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return azkar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let islamicDuaCell =  islamicDuasTableView.dequeueReusableCell(withIdentifier: "IslamicDuasTableViewCell")as! IslamicDuasTableViewCell
        islamicDuaCell.configureCell(data: azkar[indexPath.row])
        return islamicDuaCell
    }
}
