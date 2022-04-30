
import Foundation
import ObjectMapper
class Azan  : Mappable {
    
    var azanName : String?
    var azanSound : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        azanName <- map["AzanName"]
        azanSound <- map["Azansound"]
    }
}

