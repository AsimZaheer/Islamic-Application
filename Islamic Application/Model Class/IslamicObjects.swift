
import Foundation
import ObjectMapper

class IslamicObject : Mappable {
    
    var name : String?
    var backgroundFrame : String?
    var imageIcon : String?
    var backgroundColor : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name  <- map["name"]
        backgroundColor <- map["backgroundcolor"]
        backgroundFrame <- map["backgroundframe"]
        imageIcon <- map["imageicon"]
    }
}
