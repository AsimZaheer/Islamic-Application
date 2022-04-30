
import Foundation
import ObjectMapper

class Food : Mappable {
    
    var foodType : String?
    var description : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        foodType  <- map ["FoodType"]
        description <- map ["description"]
    }
}
