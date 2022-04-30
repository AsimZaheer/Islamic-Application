
import Foundation
import ObjectMapper

class Umrah : Mappable{
    
    var day : String?
    var detail : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        detail <- map["detail"]
    }
}
