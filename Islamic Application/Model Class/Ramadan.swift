
import Foundation
import ObjectMapper

class Ramadan  : Mappable {
    
    var title : String?
    var detail : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        detail <- map["detail"]
    }
}
