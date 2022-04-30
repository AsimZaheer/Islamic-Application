
import Foundation
import ObjectMapper

class AllahNames : Mappable {
    
    var number : String?
    var name : String?
    var meaning : String?
    var transliteration : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        name <- map["name"]
        meaning <- map["meaning"]
        transliteration <- map["transliteration"]
    }
}
