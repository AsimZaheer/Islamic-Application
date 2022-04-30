
import Foundation
import ObjectMapper

class Eid: Mappable {
    
    var title : String?
    var detail : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        detail <- map["detail"]
    }
}
