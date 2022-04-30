
import UIKit

class HadithViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var hadithTabelView: UITableView!
    var hadith = [HadithDetail]()
    var navigationTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hadithTabelView.register(UINib(nibName: "HadithTableViewCell", bundle: nil), forCellReuseIdentifier: "HadithTableViewCell")
        self.hadithTabelView.dataSource = self
        self.hadithTabelView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.navigationItem.title = navigationTitle
        self.hadithTabelView.estimatedRowHeight = 350
        self.hadithTabelView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hadith.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hadithCell = self.hadithTabelView.dequeueReusableCell(withIdentifier: "HadithTableViewCell", for: indexPath) as! HadithTableViewCell
        hadithCell.configureCell(data: hadith[indexPath.row])
        return hadithCell
    }
}
