
import Foundation
import ObjectMapper

class Quran : Mappable {
    
    var id : Int?
    var name : String?
    var transliteration : String?
    var total_verses : Int?
    var surah  : [Surah]?
    
   required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        transliteration <- map["transliteration"]
        total_verses <- map["total_verses"]
        surah <- map["verses"]
    }
}

class  Surah : Mappable {
    
    var id : Int?
    var text : String?
    var translation : String?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
        translation <- map["translation"]
    }
}
