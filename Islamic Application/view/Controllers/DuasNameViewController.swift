
import ObjectMapper
import UIKit

class DuasNameViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource ,  UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var duasNameCollectionView: UICollectionView!
    var islamicDuas = [IslamicDuas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        duasNameCollectionView.register(UINib(nibName: "DuasNameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DuasNameCollectionViewCell")
        jsonMapping()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self._navigationBarSetUp()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.islamicDuas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0 - 10
        let yourHeight = yourWidth
        return CGSize( width:  yourWidth , height: yourHeight)       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let duasNameCell = duasNameCollectionView.dequeueReusableCell(withReuseIdentifier: "DuasNameCollectionViewCell", for: indexPath) as! DuasNameCollectionViewCell
        duasNameCell.configureCell(data: self.islamicDuas[indexPath.row])
        return duasNameCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let IslamicObjectsStoryboard = UIStoryboard(name: "IslamicObjects", bundle: nil)
        let islamicDuasController =  IslamicObjectsStoryboard.instantiateViewController(withIdentifier: "IslamicDuasViewController") as! IslamicDuasViewController
        islamicDuasController.azkar = islamicDuas[indexPath.row].data ?? [Azkar]()
        islamicDuasController.navigationTitle = islamicDuas[indexPath.row].azkarName
        self.navigationController?.pushViewController(islamicDuasController, animated: true)
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "IslamicDuas")
        self.islamicDuas = Mapper<IslamicDuas>().mapArray(JSONObject: json) ?? [IslamicDuas]()
    }
}
