
import Foundation
import ObjectMapper

class HadithName : Mappable {
    
    var name : String?
    var data : [HadithDetail]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["hadithName"]
        data <- map["data"]
    }
}

class HadithDetail : Mappable {
    
    var arabic : String?
    var englishTranslation : String?
    var urduTranslation : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        arabic <- map["arabic"]
        englishTranslation <- map["englishTranslation"]
        urduTranslation <- map["urduTranslation"]
    }
}
