
import Foundation
import ObjectMapper

class Namaz : Mappable {
    
    var step : String?
    var image : String?
    var detail : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        step <- map["step"]
        image <- map["image"]
        detail <- map["detail"]
    }
}
