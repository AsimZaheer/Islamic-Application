
import Foundation
import ObjectMapper

class Wudu : Mappable{
    
    var stepNo : String?
    var detail : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        stepNo <- map["wudustep"]
        detail <- map["detail"]
    }
}
