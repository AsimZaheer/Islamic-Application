
import UIKit
import ObjectMapper

class FoodViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var foodTableView: UITableView!
    var foods  = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        foodTableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
        self.foodTableView.delegate = self
        self.foodTableView.dataSource = self
        self.foodTableView.estimatedRowHeight = 350
        self.foodTableView.rowHeight  = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodCell = self.foodTableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
        foodCell.configure(data: foods[indexPath.row])
        return foodCell
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "HalalFood")
        self.foods = Mapper<Food>().mapArray(JSONObject: json) ?? [Food]()
    }
}
