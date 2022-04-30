
import Foundation
import  ObjectMapper

class Hajj : Mappable {
    
    var day : String?
    var step : String?
    var description : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        step <- map["steps"]
        description <- map["description"]
    }
}
