
import Foundation
import ObjectMapper

class PillarsOfIslam : Mappable {
    
    var name : String?
    var description : String?
    var englishTranslation : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        englishTranslation  <- map["englishTranslation"]
        description <- map["description"]
    }
}
