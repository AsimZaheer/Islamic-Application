
import UIKit
import ObjectMapper

class MainViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var alQuranView: UIView!
    @IBOutlet var alQuranStackView: UIStackView!
    @IBOutlet var mainIslamicObjectsCollectionView: UICollectionView!
    var islamicObject = [IslamicObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        jsonMapping()
        mainIslamicObjectsCollectionView.register(UINib(nibName: "MainIslamicObjectCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainIslamicObjectCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpView(){
        alQuranView.layer.cornerRadius = 15
        alQuranView.layer.borderWidth = 1
        alQuranView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alQuranView.layer.shadowColor = UIColor(displayP3Red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.1).cgColor
        alQuranView.layer.shadowOpacity = 1
        alQuranView.layer.shadowOffset = .zero
        alQuranView.layer.shadowRadius = 30
        alQuranView.layer.shadowPath = UIBezierPath(rect: alQuranView.bounds).cgPath
        alQuranView.layer.shouldRasterize = true
        alQuranView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func jsonMapping(){
        let json  = self.readJsonFile(fileName: "IslamicObject")
        self.islamicObject = Mapper<IslamicObject>().mapArray(JSONObject: json) ?? [IslamicObject]()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return islamicObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0 - 5
        let yourHeight = yourWidth
        return CGSize( width:  yourWidth , height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mainIslamicObjectCell = mainIslamicObjectsCollectionView.dequeueReusableCell(withReuseIdentifier: "MainIslamicObjectCollectionViewCell", for: indexPath) as! MainIslamicObjectCollectionViewCell
        mainIslamicObjectCell.configureCell(data: islamicObject[indexPath.row])
        return mainIslamicObjectCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        if index != 12 {
        self._navigateController(index: index)
        }
    }
    
    @IBAction func dailyAzkarButton(_ sender: UIButton) {
        self._navigateController(storyboardName: "IslamicObjects", viewController: "DuasNameViewController")
    }

    @IBAction func alQuranButton(_ sender: UIButton) {
        self._navigateController(storyboardName: "IslamicItems", viewController: "SurahsNameViewController")
    }

    @IBAction func kaabhDirectionButton(_ sender: UIButton) {
         //self._navigateController(storyboardName: "IslamicViews", viewController: "QiblaViewController")
    }
    
    @IBAction func namazStepsButton(_ sender: UIButton) {
        self._navigateController(storyboardName: "IslamicViews", viewController: "NamazViewController")
    }
}
