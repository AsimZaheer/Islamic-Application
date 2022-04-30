
import Foundation
import UIKit

extension UIViewController {
    
    func readJsonFile(fileName : String ) -> NSArray {
        let url = Bundle.main.url(forResource: fileName , withExtension: "json")
        guard let jsonData = url else{
            return NSArray()
        }
        guard let data = try? Data(contentsOf: jsonData) else {
            return NSArray()
        }
        guard let json = try? JSONSerialization.jsonObject(with: data, options:[]) as? NSArray
            else{ return NSArray()
        }
        return json
    }
    
    func _navigationBarSetUp(){
        let backBTN = UIBarButtonItem(image: UIImage(named: "backButtonImage"),style: .plain,target: navigationController,action: #selector(UINavigationController.popViewController(animated:)))
        backBTN.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationItem.leftBarButtonItem = backBTN
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func _navigateController(index: Int){
        var story = ""
        var viewController = ""
        if index == 6 {
            story = "Main"
            viewController = "KalmasViewController"
        }
        else if index  == 0 {
            story = "IslamicItems"
            viewController = "AzanViewController"
        }
        else if index  == 2 {
            story = "IslamicViews"
            viewController = "HadithNameViewController"
        }
        else if index  == 9 {
            story = "IslamicViews"
            viewController = "GuidanceViewController"
        }
        else if index  == 8  {
            story = "IslamicViews"
            viewController = "CalendarViewController"
        }
        else if index  == 1 {
            story = "Main"
            viewController = "TasbeehViewController"
        }
        else if index  == 3 {
            story = "IslamicObjects"
            viewController = "FoodViewController"
        }
        else if index  == 4 {
            story = "Main"
            viewController = "ZakatViewController"
        }
        else if index  == 5 {
            story = "IslamicObjects"
            viewController = "WuduViewController"
        }
        else if index  == 10 {
            story = "IslamicObjects"
            viewController = "RamadanViewController"
        }
        else if index  == 11 {
            story = "IslamicObjects"
            viewController = "PillarsOfIslamViewController"
        }
        else if index  == 7 {
            story = "IslamicItems"
            viewController = "AllahNamesViewController"
        }
        else if index  == 13 {
            story = "IslamicItems"
            viewController = "EidViewController"
        }
        let stroyBoard = UIStoryboard(name: story, bundle: nil)
        let controller =  stroyBoard.instantiateViewController(withIdentifier: viewController)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func _navigateController(storyboardName: String, viewController: String){
        let stroyBoard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller =  stroyBoard.instantiateViewController(withIdentifier: viewController)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
