
import UIKit
import ObjectMapper

class AllahNamesViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet var AllahNamesCollectionView: UICollectionView!
    var nameOfAllah = [AllahNames]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonMapping()
        self._navigationBarSetUp()
        AllahNamesCollectionView.register(UINib(nibName: "AllahNamesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllahNamesCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameOfAllah.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let AllahNamesCell = AllahNamesCollectionView.dequeueReusableCell(withReuseIdentifier: "AllahNamesCollectionViewCell", for: indexPath) as! AllahNamesCollectionViewCell
        AllahNamesCell.configureCell(data: nameOfAllah[indexPath.row])
        return AllahNamesCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.0 - 10
        let yourHeight = yourWidth
        return CGSize( width:  yourWidth , height: yourHeight )
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "AllahNames")
        self.nameOfAllah = Mapper<AllahNames>().mapArray(JSONObject: json) ?? [AllahNames]()
    }
}
