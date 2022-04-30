
import Foundation
import ObjectMapper

class Kalmas :Mappable {
    
    var kalmaName : String?
    var data : [KalmasData]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        kalmaName <- map["kalmaName"]
        data <- map["data"]
    }
}

class  KalmasData : Mappable {
    
    var kalmaNumber : String?
    var arabic : String?
    var meaning : String?
    var englishMeaning : String?
    var audio : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        kalmaNumber  <- map["number"]
        arabic <- map["arabic"]
        meaning <- map["meaning"]
        englishMeaning <- map["englishTranslation"]
        audio <- map["audio"]
    }
}
