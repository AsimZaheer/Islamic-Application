
import UIKit

class QuranViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet var alQuranTableView: UITableView!
    var quranPak = [Verse]()
    var quranPakUrdu = [Verse]()
    var navigationTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alQuranTableView.register(UINib(nibName: "AlQuranTableViewCell", bundle: nil), forCellReuseIdentifier: "AlQuranTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.navigationItem.title = navigationTitle
        self.alQuranTableView.delegate = self
        self.alQuranTableView.dataSource = self
        self.alQuranTableView.estimatedRowHeight = 350
        self.alQuranTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quranPak.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let alQuranCell = alQuranTableView.dequeueReusableCell(withIdentifier: "AlQuranTableViewCell", for: indexPath) as! AlQuranTableViewCell
        alQuranCell.configureCell(data: quranPak[indexPath.row], quranPakUrdu: quranPakUrdu[indexPath.row])
        return alQuranCell
    }
}
