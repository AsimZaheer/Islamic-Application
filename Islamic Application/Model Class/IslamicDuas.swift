
import Foundation
import ObjectMapper

class IslamicDuas: Mappable {
    
    var azkarName : String?
    var image : String?
    var  data : [Azkar]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        azkarName <- map["azkarName"]
        image <- map["Image"]
        data  <- map["data"]
    }
}

class Azkar : Mappable {
    
    var duaTitle : String?
    var arabic : String?
    var urduTranslation : String?
    var englishTranslaton : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        duaTitle <- map["duatitle"]
        arabic <- map["arabic"]
        urduTranslation <- map["urduTranslation"]
        englishTranslaton <- map["englishTranslation"]
    }
}
